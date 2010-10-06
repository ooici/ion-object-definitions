
public class ProtoTest {

	public ProtoTest() {
		System.out.println("Get the builder for the variable...");
		net.ooici.data.netcdf.Variable.IVariable.Builder varBuild = null;
		/* Well known */
//		varBuild = net.ooici.data.netcdf.Variable.IVariable.newBuilder();
		
		/* More Dynamic - the getBuilder method generates the Builder from the fully-qualified classname string */
		varBuild = (net.ooici.data.netcdf.Variable.IVariable.Builder) getBuilder("net.ooici.data.netcdf.Variable$IVariable");
		
		varBuild.setId(1234).setName("First Var");
		
		System.out.println("Generate some attributes...");
		net.ooici.data.netcdf.Attribute.IAttribute.Builder attB1 = (net.ooici.data.netcdf.Attribute.IAttribute.Builder)getBuilder("net.ooici.data.netcdf.Attribute$IAttribute");
		attB1.setName("Att One").setValue("Value for Att One");
		net.ooici.data.netcdf.Attribute.IAttribute.Builder attB2 = (net.ooici.data.netcdf.Attribute.IAttribute.Builder)getBuilder("net.ooici.data.netcdf.Attribute$IAttribute");
		attB2.setName("Att Two").setValue("Value for Att Two");
		
		System.out.println("Add the attributes to the variable...");
		varBuild.addAtt(attB1.build());
		varBuild.addAtt(attB2.build());
		
		System.out.println("Generate some data...");
		net.ooici.data.netcdf.Array.IArray.Builder arrB1 = (net.ooici.data.netcdf.Array.IArray.Builder)getBuilder("net.ooici.data.netcdf.Array$IArray");
		arrB1.setType("int32").addValue(2).addValue(3).addValue(5).addValue(8).addValue(13);
		
		System.out.println("Add the array to the variable...");
		varBuild.addData(arrB1.build());
		
		System.out.println("Create the variable...");
		net.ooici.data.netcdf.Variable.IVariable var0 = varBuild.build();
		
		System.out.println("Contents of the variable:");
		System.out.println(var0.toString());
		
// 		System.out.println("Get the builder of the first variable {.toBuilder()}...");
// 		net.ooici.data.netcdf.Variable.IVariable.Builder var1Builder = var0.toBuilder();
// 		
// 		System.out.println("Add another attribute...");
// 		var1Builder.addAtt(net.ooici.data.netcdf.Attribute.IAttribute.newBuilder().setName("New Att").setValue("Value for New Att").build());
// 		
// 		System.out.println("Build to a new instance...");
// 		net.ooici.data.netcdf.Variable.IVariable var1 = var1Builder.build();
// 		
// 		System.out.println("Contents of new variable instance:");
// 		System.out.println(var1.toString());
// 		
// 		System.out.println("Contents of original variable:");
// 		System.out.println(var0.toString());
	}
	
	private Object getBuilder(String qualifiedName) {
		try{
			/* This could be a way forward...but still need to cast to the appropriate type to have access to class-specific methods... */
			Class myclass = Class.forName(qualifiedName);
			java.lang.reflect.Method buildMethod = myclass.getDeclaredMethod("newBuilder", new Class[0]);
			System.out.println(">>> Found Method: " + buildMethod);
			return buildMethod.invoke(null, new Object[0]);
		} catch (java.lang.ClassNotFoundException ex) {
			ex.printStackTrace(System.out);
		} catch (java.lang.NoSuchMethodException ex) {
			ex.printStackTrace(System.out);
		} catch (java.lang.IllegalAccessException ex) {
			ex.printStackTrace(System.out);
		} catch (java.lang.reflect.InvocationTargetException ex) {
			ex.printStackTrace(System.out);
		}
		return null;
	}

	public static void main(String[] args) {
		new ProtoTest();
	}

}
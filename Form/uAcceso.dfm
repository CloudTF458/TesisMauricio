﻿object frmacceso: Tfrmacceso
  Left = 439
  Top = 219
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Control de Acceso'
  ClientHeight = 193
  ClientWidth = 419
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000007777770000000000000000
    0000000000000007000000000000000000000000000000070000000000000000
    0000000000777007000000000000000000077070007770070000700000000000
    0077000700787000000007000000000007708000077877000070007000000000
    07088807777777770777000700000000008F88877FFFFF077887700700000000
    00088888F88888FF08870070000000000000880888877778F070007000000007
    77088888880007778F770077777000700008F088007777077F07000000700700
    008F08880800077778F7700000700708888F0880F08F807078F7777700700708
    F88F0780F070F07078F7887700700708888F0780F077807088F7777700700700
    008F0788FF00080888F77000007000000008F0780FFFF0088F77007000000000
    0008F07788000888887700700000000000008F07788888880870007000000000
    00088FF0077788088887000700000000008F888FF00000F87887700700000000
    0708F8088FFFFF88078700700000000007708000088888000070070000000000
    0077007000888007000070000000000000077700008F80070007000000000000
    0000000000888007000000000000000000000000000000070000000000000000
    000000000777777700000000000000000000000000000000000000000000FFFF
    FFFFFFFC0FFFFFFC0FFFFFF80FFFFFF80FFFFE180E7FFC00043FF800001FF800
    000FF800000FFC00001FFE00001FE0000001C000000180000001800000018000
    00018000000180000001FC00001FFC00001FFE00001FFC00000FF800000FF800
    001FF800003FFC180C7FFE380EFFFFF80FFFFFF80FFFFFF80FFFFFFFFFFF}
  Position = poDesigned
  OnActivate = FormActivate
  OnClose = FormClose
  TextHeight = 13
  object Label1: TLabel
    Left = 185
    Top = 57
    Width = 57
    Height = 16
    Caption = 'Usuario :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 199
    Top = 84
    Width = 44
    Height = 16
    Caption = 'Clave :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Image1: TImage
    Left = 38
    Top = 32
    Width = 123
    Height = 124
    Picture.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000780000
      00700806000000D537B4BF000000097048597300000B1300000B1301009A9C18
      0000260B4944415478DAED9D09DC4DE5F6C7F7DBA072A9AE8A0C4585465C0A29
      53F1DE94D24D84B79437258A52325C1A9406AE8848A2C970698E22B7C84DBC8A
      261AB875AF2BA559DD4A6E34FED7F7F95BFBB3CE7EF739679F73F631FCFF7E9F
      CFF9789D619F673FEB596BFDD6F03CA7E0E79F7FF6D2A1A0A0C03D14BFFDF65B
      C2DFFADAAFBFFEEAEDB6DB6EEE5F1E7BECB187FFBC5E87D72DECB5807DFDCB2F
      BFF45E7BEDB5A366CF9EDD78D9B2652DFFF39FFFD45DB76EDDA1F2D25EF2F8A5
      5AB56A1F57AA546955EDDAB55F6CDFBEFD2B8D1A357AE3D0430FF53FAFDF1B1C
      67D8FD2503D7B0AFDBF17DF1C5178CEFB879F3E6355EB264C9291B366C386EFD
      FAF587C84B7BCAE36719CB47FBEEBBEFBBC71D779C1B5FB366CDDE3AF8E08313
      C614BCFFB851B02309585FFBD7BFFEB5FBDD77DF5D3C79F2E44B366DDAD438EA
      CDC8E7D79E7FFEF993BA75EB36E5D4534FFDD44E621C02D6F1BDF7DE7B65C78D
      1B57FCC0030F5CFAC30F3FD48B3ABEB265CBBE53545474DFC5175FFC5093264D
      BEB573932FEC1002D6EB33964183065D7CE79D770E96CF1C91C37D6DBAE0820B
      EE183E7CF8D0AA55ABBA277EF9E597AC05BCFBEEBBBBBFC5827843860CE93371
      E2C44132EE2A398CEFCBAE5DBB8E1C3B76ECC8DFFFFEF709731437B6BB80F579
      3175FB77E9D265BA686FDB5463D97BEFBDBDBDF6DACB09ECFBEFBF4F39EEDFFD
      EE77AB274D9A74BE68CD9BA926319580F5F5850B175697EB4CFFFCF3CF9BA61B
      1FF7CDBC6EDEBC39E5752B56ACF8CA9429538ADAB469B336D5F872C17615B07E
      6EE6CC99C7CAE43D277F560D7EB708C99309F08E38E208AF5EBD7ADE21871CE2
      952953C64D203EF0ADB7DEF2D6AC59E3FDFDEF7FF7C4FF858EFFBAEBAE6B3F6C
      D8B0A7924D623ACD16537C52F7EEDD195FB9E07BC4C77A279C708257A54A1537
      C6030F3CD0693C0BF0ABAFBE7263FBE4934FBCD75F7FDDFBE69B6FC2BE66F3F8
      F1E3DB5D71C515F3F321E4ED2EE0471F7DB46EA74E9D5E95FF96B1DF8926F4EB
      D7CF3BEBACB33C2129EE7BFEFBDFFF3AAD55738BF07920F07FFFFBDFDE73CF3D
      E7C964B9BF83B8FCF2CBCF17BF3E236C12C304ACCFFDF5AF7F6D25E67E419860
      3B74E8E09D78E2891EC48E6BA2B1E293FD79D8679F7DDC7D20F00F3FFCD05BBE
      7CB9F7F8E38F3B531F84B893B603070E7C366EE2B5CD05CC83CF70D362960F6A
      D8B0E107F25259FB7D679E79A677F3CD373BC1B2FAD1D4E0182C10F87EFBEDE7
      1D7EF8E1DEA79F7EEADD71C71D9E90A052EF134D6C5D5C5CFC42BA49D4EF9A3B
      77EE3132967783AF0B81F32EBAE8220FFF2E26DBFBEEBBEF425D8F82FB2F5FBE
      BC0783667CB268BCBFFDED6FA5DE27CFD53DEDB4D3DE8E53C8B10938D50D5A41
      0084CB6AAF51A3C65B324175EC7BFAF7EFEFDD72CB2DCEBCB1EA796F3A1FA9E0
      5E309198CA071F7CD013B61A7CCB8FEFBFFF7E955AB56A7DA5630903DF29DF5F
      50B972E58F7FFAE9A7CAF6B54B2FBDD4138BE3C6C743095814F09D071C708077
      D04107798F3CF28877EFBDF726BC2E96E80BC22C79FDC754E3CB043909384CA8
      12D63853AA5A5AAE5C39478A82905066A8108C1BED7308F72F7FF98BB76AD52A
      678A33993C855A91060D1AE0DB3D099B125EAF53A7CE02F1DB85FCCDBD07EF4B
      1754CB962DEF59B468514FFBD99E3D7B7A420409E3BC1F7FFC31D2A20E1BDF9E
      7BEEE9D5AC5913F7E44D983021E1F5A64D9BCE58BC78F1F98C250E7F9C9580ED
      DF6BD7AE2D3367CE9C0612ECB71273DAECE38F3FAE24D72C2BAB710FF1473F89
      80378A8FFA50B4EA8576EDDA2D95C78A75EBD6ED7EF4D147277CF139E79CE33D
      F9E493DE3BEFBCE3FC5836936705C543CCBF33F537DE98B08EBCA953A7B69230
      65A1C6B8EA520093BF60C182A30A0B0B57DBCFB46DDBD6131F490C9C32E48A3A
      3E16D291471EE94948E83DF5D45309AFCF9F3FBF6EEBD6ADDF16EB91BD645556
      9908D8DE94109A23EEB9E79EE2D9B36777F342D86F32881F62627F12BF7A9A3E
      57A95225EF8D37DEF0B8217C5A369A1B3689580E5948DE29A79CE22D59B2C47F
      4D4CEFBBB2188FE36F84A50B02CEC03D0A5B9F2D5ADE4EDF0F73977B75E4080B
      958B70EDF82061DC7BAF5EBD5014FFB5FAF5EBBF20F3D19AF7E46AAA230BD864
      71F694957C8B08B69FFC376749C080211DA79F7EBAF7F6DB6F3B0D8A0B4CCE61
      871DE6AD5EBDDA138DF0AC468896D66BD5AAD55B3A812A6031CB15C53C7F6EAF
      73C30D3778279D749263E7712C3E3B3E18388B9BEFB09005565DDCC987413792
      29D20A586F1C08293859E2B5E932B01AA93E53A14205F71926342C2408BE5726
      DB69DACA952B33225551C0F8F1C7B880A79F7EDA7FBE63C78EF78A0FEC69D398
      3C7AF4E871CDE4C99347E9FB8E3AEA286FD4A8519EB89EBCE48DF94E2C042121
      DC4371E59557DE3E76ECD8C16A61B2BE7E3A01EB8ABDFAEAAB2F183366CCB4B0
      F7201CD10617F033996202FD708855FFEAABAFBA405F7CB52B200401F3BDEFBE
      FB3C09115CE2026B91A9907512B0088424A400B90E6488EB0B7171E18DDE6F95
      2A55D68AD00EE76F2651EF53FCE23261DA8DF4BA307158332634CE8567C78D16
      8BDF75FE5821166341494949A18E2F5BA414B0DEF4A041832E1D3162C4A4E0EB
      7FF8C31FBC01030678E79D775E24D3F5F5D75F3B667BD34D37850A1AB2A14256
      AB11658278E0CBF6DF7F7F673108AF5E79E5154F04E57DFBEDB78E40E18F2171
      267DF893BCAF0CDAA3E073D5AB57C73C57E4FF7C8649E7BA1B376ECC7A92D381
      A4C9679F7D8612F9CFC9FD7F2F0BF0E08A152B6ECA49C0C9981AAB9FC7C89123
      DB8A10E7045F27561D3264883FC9E9F2C200CD02A4ECB899871E7A287130A221
      B26A1DBB4438E9FC3163C75A105BE2BF5920CF3FFFBC63BAE9F2C0A06AD5AA4B
      844DDF2924E729D1A2DFE4B307C902FB425F47B36EBFFD7677AD285C255B709F
      3C44919C2B503CFBECB3CD859B2CCE49C0C93E8C7057AC585149181D6537DF36
      A1A9985AF2C3000DC924A4419BC83A81BBEEBACBBBEAAAAB125E67525F7EF965
      174BB310C2CCA266C98E39E61847A060B812537B5BB66CC96A12C4ACAFB9EDB6
      DBFACAE73F16B2F386CE09AE67E8D0A14E7BE34A3C240359B1E1C38727B0FD69
      D3A69D77C105173C869BC916A1265ACD6DAD5AB5164B509F503D61F2C9BF122E
      641B0FA2F165CB96754222A5288422E175D28093264D72A42BB878182FFEB55A
      B56A4EA8D75F7FBDCB28C50189D9D78AB61E22DFE1FC037CE2BAEBAE73D7CF77
      DD165771F7DD77931EF59FBBFFFEFB2F140E302D27921534D1080C01CB97B5E9
      DDBBF73CFBDAF4E9D35D6608E1E67AC3EA1749C60B332F95D159B870A1D3202A
      44BA8810AEF824479AAEB9E61A47CCC2402A90CAD3C9279FECFEC5C78175EBD6
      39B207E9233449A79562BDFC05B42D044CA144CCB2FF9C08B8AB08787A50C099
      28552901A355983A99C4F7C4AFD6D6E7DBB56BE749ECEBFC1126230E4669CD75
      8D1A359C00147FFAD39F3051CE9F0284414885808B8A8A1256BA02CB02EB15B3
      E69208A900A14263C807E366C2001780106A052B0E202CAC12F38C22F12F0FEE
      6BF0E0C1CE422A44A13A88423DA1F3ADF9080DEBA214254A9968BE74C68C190D
      E4C2AFEB7368D9071F7CE0986AA63E371D54C854574876D87170B30815668CB6
      53444078C1D41EEFC502480C9BF1F7C3E631C3B88420F08BA3478F76162B97B4
      A10A81BC3CF7CA3D5381D2F2A21384086CD8B061AE72A61F93055F5938C9E7BA
      B874DEF57A190B587D6F6161E1FD0B162CF04B314C2ADA1487690E03DAC62A26
      A9A01A0B58D1304B8814E6929C32ACD602334E0283E47D2E08AB3E3126884FED
      DAB59DABC8348BA502C065C03950121A00962D5BE6AE0779634E914148426393
      90C7965DBA74794DAD9C15ACBD7E2A9412305F289ABA4EFEF5DB13172D5AE435
      6FDEDCADBA7C05FBF8C920E142A34963B2A80883C8295B502FC697C695DE24C4
      220EB7A0C68C1613C367A2C5088C7BC2F432763805F318259CD46991478110CA
      25C28526F4EDDB7726D60CA8926524604D49CE9B37EFC033CE3883D0C831499C
      3FFE0AE433D827467EF7DD779DD01468345D1AC4B94D9B36256CF35F63557FF4
      D1477E6C1D175850582C8B4B2EB9C42573D0BE74EE49271DF38E301F7BECB152
      2E251B8815582AA1DC40198B8BA3107224016B8C85662260211EA7C98AF1DB0D
      D05C561EC42B97782C1D10146C158DC152E898FEF9CF7F3A134DEB8EC50B2FBC
      E0528FF940D7AE5D5DC4A04013F1F16865AA048A4E36050E42BC3163C6B88E94
      64C06C637DD42A727DE2FF5484AE53A74E37C9221CAA7D5F91355819DAB5D75E
      DB7BD4A8517EBF0B7E49E8BA5B8DF96CD286C871B330617C9402D3F6C0030F24
      4CB832FA7C01E2437B8D2E344028C7F7925B0FD3629D1B16280A71EBADB7865E
      9B100FB28AE9C60AD93626802241B458EC4415619CA76EDDBA8F2C5FBEBC33C4
      335D86AD20283461CF370A8B1EAAFF271D495A329FE619306934D05158D75890
      E7C805A3095A2FE5394C2561553EF1E73FFFD9112C05248E8C193D55F094A090
      1104C27DE9A59742854B3EFBD8638F75091A04A3163138FF58515EE7FADA9569
      89A7A261C386B34A4A4ACE41295209B9C036C401F13FD78B09B859DF008B85B9
      E64BC0DADD8070015AF2CC33CFB8BF798E44C5D2A54BFDF7D390A7AFE713844F
      F8514BAC70132458C817A3DDCAAA3195088E561E5E0F02A62F5AE70447981925
      03C8BC70FF5836B80621A386548A366DDADC2D9CA9B78E21B43B546F408B0B12
      D85F3A74E8503F28A40749343AF61049491D7E08FCE31FFF70BDCDC48268891B
      9C315D8A5AB56AB94447E3C68D13E2E67C80D0CC12BBAD93EAF5E9D3C74D28FE
      95F111DF2288CB2EBBCCB16D0BC689805110FC772639044D68A0FDF866DC55B0
      BE3E62C4888E03060C783C19E14AC86431E193274F3EB9478F1E7EC69B01527A
      E37D512A34516033586827293ACA8899E2F8E38F77842858B0880B0892B10541
      9183A40A2617C111BED02C68D38C809E30A2024D75661B62F259881EFF92C10B
      845A5BC4A2EC5FA54A95CD615A5C4AC0620AF639E9A49336785B7B95095158A9
      14D27335D3BA2261CCAC4421748E40E50A1211C4AAF8EF38F1F0C30F3B0B960C
      124EBA4E11CC351D191664DD8840106E1CE414E1A2C954D85848F69A32C63162
      65AF0EEBC42C95E8D8DA27B45A847A943E4F0F2F71602E890EBE1C4240D68A16
      1D8A16262D570AE481F181983EC6C482204EC6552443DFBE7D13BA2272056CB8
      65CB9669DFC718AD75C377C215985BC8545CC9218447560CB711741D22AF7295
      2B57DE14245C091AAC7E58CCDEAD12960CD6E76958A3A504279F4DE1DBFADBA9
      53A7BA726018C854A185F859CC1F6649278771C228F1D5548430E9614582C2C2
      4297918A03D4669B356BE6FF5F48D22619C75E32D129DB4D706B2469366CD810
      6BDE1EA0842C2888A65DEC03070E1C20AC7F6430364ED0601584DCD82172631F
      DA0BB3AF069F924DB101214144E8E0282E2E2EF53A1D8B34BD3399AC7E26068D
      B58B8F6B2070E248DC058C95FCF8C891234B5D0FAD83B0E50A1A1B6C824504BC
      51C6B44F2A013346D29D8C3D1F4D02C8887A38D68C34AD4258FA92952B57BAD5
      68BFB75435491BDE4E38E184E745530AF5F93A75EAB85E29DDB61955C89A670E
      6A838276510D2D48223031A992FA36814F1A95663A528968B7052EC02647B201
      F13FF5E064A85EBDBA63B7B6BF0C3ED0A44913E77BF391B7076830329010C93E
      FDABC4CBD5E4FB3F4D107030FDA8294BF193478BB95B655F83AD92744008DC58
      94BC2C848AEF607B6530844003C9FBAA6FCDA45AA384025308F983EC50C80FBB
      7EB6F8E31FFFE85C5318B034341C301F36F3C6222626CEA0A8903190115C86B0
      C92EAE2953A674BCF0C20B1FB7442BB46547B558FCE104616CBDEC6BECDC8331
      721126369590353B858691EEB4E0FFA4415F7BED357FD0D980C5460689EFA283
      83663D0BC6887BC80698C2247B7A1D5FA07CC916525C0AC07510276B4F78BEC0
      E2263463EE6C2FF5840913AEE8D5ABD78404D716E62734BBC4CD1D7CF0C11F08
      13AC6E5FA74EABE938566A588CA7A6990140982CC8EB125F4296529D9D1115DC
      10A691DC2D5527AC8B820D63A41833455855C982840CF1B0688C4F76B056F487
      837C37E931B7583ECBA6C5D50D1E356AD4ED297DB0FFC2D6E2C3D2A54B6B8866
      E0E01254952C125D915A68E73A4CAC3DB004ED0D5666C8EA9076235BC5E288CB
      4F2164D82B0907D2AB162C544DAC4405E384B187816201E61F6B017F5037C7A4
      6B852BDF026631A13C56C042B46E12A235D4BE2FD2CE0661A427CAC04BBC8090
      11E2E5975FEEF6CC926B0D829B0C36B0D339D1B97367574E8BDADC1E15E47AA9
      02356AD428613397EDE18E82C99327A76CFF81C0611960B12C26CD116F4B01AB
      757CF3CD37FDE724FCBC4122956149C3A430A83F96A0BF9E1099D912BE540F7B
      1F4501323B305BBE1CFF45A882CF56C0C4212D74F1E7A3911C57813BA0998E1D
      170A7CB3ED374E055A69EC6E8730707DDDDD8F80353F0CF12144D21383F209B2
      5A2809918D62DCB87157F7EEDD7B0CD64C2D635A01DB9D852298F24298C6CF9D
      3BF7C26C06255FEE367285F53BC70552AB547BF0C5F61E101C4C3E1530B5B072
      ABFD41705DAC018B145056D4BFF91E92422CEE60E5276EA0449426A9342984D7
      74137E33C5CAB4200ADBD35E69D0A74F9FEE72A1FBD27E2804B4AF1046243B0D
      270E304E7C2461930D5FF86E186F32C009C882415C52814DE0DC03F9796271E2
      6436AD2BB052ECD94AC6BEE380D6808983ADFCC43AD69705B62281644511B0E6
      9165A5EE56B97265F2837EDCC18A856C68DF56323019C46D08C0B2DCB8819966
      92319D63C78EF59FA7E5868DD661A0678A902D281421891F0B4346ED9DBDC374
      93EB269BC704B3CD866318E0150A16170B2559AF75AE4016DA8F86062B442EEF
      8BE21C89658CC4A22DD44CCB6AED2084E5317D9EF8930C12E688B41EA691C01B
      DFC464D1CEAA0B88FC326D367ADC503E41C8842BA0695D41C7262EC282389254
      27420AA2418306B7CA7DD55EBD7A75477D0E72C842D0E63B4C31ADB0D6DFAB99
      26A54A0C9E8F6C16FE97828DD6CD415151D14409ED7A31BF190B58CDB330D4E5
      22BC86FABCB6F32403545E333A5487D0946D21604A75682F1BC7EC5829C8635A
      A9415321B326DCA25FBF7ED7B568D162B44CDA2732FEFD794EF751A13D5A3645
      C8F456E1876DC2811D8F64C1205F71F6B131772C2AEE016B682184B66ECB962D
      DF0EB2F7C83BFC85851E26BE27E18431CC0469B9609D18C1A2C5C4C82AE06DA9
      C17C17A6D40A584FC74BD59552AE5CB90F44B823E573138A8B8B474AC871ADBE
      468C4DE6CA921AAE453EFAC5175F74F1B705F9682C495C15253D738407D6D236
      044AE4B0447840B3B0333DD2FA603D52E1DC73CF1DFBE4934FFA5DE984036C37
      4158C16B20604C34C9026598AC6A4224AE954F86C94DD24501F9B1215A148850
      1E10EDEE2E7CA2AC088EFCA3BFC1090B40C7276E2878BC30F7C67E675A7CEDBC
      910CD24DE9B99E1A0407E25A849EB8050B99D77AE216DE0A53D648890E71DE65
      6AD4A8B15E56C741FA3C0C8EBC6B58F9501BE80839F4A699143E439C8A76E70B
      7C0F5A85BFC44FA502E6164D5033BAF7DE7BFF248BAF8C10B2420937FCA232E1
      151D2390C3E062468B2156A449ED0E7DA071B176B064E38FB93ED7219F8E4BA1
      47DC42AE3F5114AD97BEB7D47C4411B0F8B30E7DFBF6F5C9152B9655948C11F3
      3CC57D6ECE16DF093130738422F92AA52134AA56B4CBD80DE1F84ADC09636701
      A08D7470F2B06CB47FFFFEC52FBFFCF2A9E292BAEA7364AE2057440B619AC8C4
      E2166866E0618149D50A13AE2C6A8787EE4224DE4546D4E38367708A22AD1165
      A98942A5EDAA4C265C3E2404E925B939BF980B3BA58E9BAC85470B0DECD883D8
      2828ECA3C5D694C5092D1FD24B65538D844D9412C34EDC0B8E31083E837F6581
      58BF17BC5F7C3C421C316284DB7511046E03A2C9C2D79EE8B093F6102AE6989A
      2FAF41A8488906433819D777B2108FAC5FBFFE67BA8D250C4935D89C1B75A8B0
      337FE32E4227090F814AD5A3855942CBD9C66141E88476D1CC1DE7995380C981
      D8D0D1A1654840735F58E7870213988CF8A1E9548EE8204977E0286694F08810
      2DCC3D205C183E261FADE3FF7AD29EEE7040E120A608148D0DDBFA220BE03B31
      D74D44B8ABD2E5BC930A5827FFECB3CFBE5384D2579F8738D0D5976E0F8DAE42
      FC341BC814982BC8168BC4E64C7305D7221F4EC62AD8F345EA31D54E08B49D02
      43184898C088952CA602F3C1C2265D4AB72847072703AE84E40F8B4B170E5A8D
      AFA61B249965152BF1E6134F3C714EA3468DD6A5D25C45A880557BD1D00A152A
      7C2703F7B7F011CBB2FB3E5D87A5F63EE3DF24A64C780D764B990DBF12474589
      7B402BB816E76A586144D909816FC57C068159A6968C36452D1E70DF2C6CB25C
      B8234AAA716DDA13173743AE79BE1E491149C0612B4573CF22884E423A1ED6E7
      618B4C1E174ED5BEAA60C259A1A4EEACC9E27902750E4EA3F090CBFE5E261E8D
      21AB8675097654A6D35E054DF4B6890D50CC878D9386CDC4D2E8118ADC1BCD11
      71ED08114599293177917E4794244ACA5376C4CF2E5EB3668D5F968101EBB142
      51A05A1C56824328AC70B68730117A0C702660EC101B4C1D2C972E0C0B8E66C0
      7F4641B09D77EB41347E289509580CB075E6CB2E1AC649AB0DC99274F978EADA
      987BFCB07585252525354593D744756F49052C4CB0B604CF09DBDA58C9082A93
      06786D990DEB878668E0ABDAB76FEFF2AA58875427BB2BB861252C9010B69804
      3A0C1D39B2079AA403C4867B53B6CA1888166864D07145015A05D1222E0EEE76
      206CC49A70AFF859123EDC8B922C16386C9C45C5351030EEC5E69CBB74E9327E
      C68C197DA29E275DCA446BF37B5151D188993367FA59741AD2499165DAFC6E9B
      DEC906DD76DB6DA5DE4347087D5AF8414C3F3714DCA8A5BD5B683EDA8120B879
      AE194C9C10E792104877D24ED838ECD14CF48123649B9E8C72BF0891F08BA313
      158C1BC28972D82DA2767FB03EF4175BF0B5B818BBBB52E671832C9E6AB200B6
      44E91A093D46E9EBAFBF2E90016197FCB22079649202D934BEB3D274373B3E29
      7890CAD6813B334B411D7F8839D3E05D85CB58E960E041B1009216045A4DF786
      FD85B1A8081E21812583246156A39A69349085454B8F8D5DB92752B7C94EEF0B
      03DFCF5C639D6C7A77FCF8F1E789423C96D10E7FF79FAD664282F5F6121E3CA1
      CFB322B51D35DB4281C6890C9A5EE2605ACF82AC1093C144E96F24F1BD984ACC
      6E32D30499931022A7733B10B02DFAB3270BCD4E170703261B4E4018686BD12C
      6C7648A8764605EF47F349D2D86A9558BA1209339B4639303CF41825F145AF08
      31F27F524EDB64733D65C79E6E078BC664C5D53F4C2C1BFC918B6CC0F188DDBA
      75F3FF4FEF159529886594CA1BEC99FA30C4514152084E904D13008B1CAD67D1
      586D15F2564308EABA740786973A6567F1E2C5359A376F9ED094A4E42A8E5DFE
      AC38AA226822E638AE10427FF3215710B342FEAC301118B13CBE38D56452AB85
      5C9173B7F7A50D005142CB308415F825841B2B8BB16F3AB2E50B581DFEB9E79E
      7BA74C949FB9D2DD7A719DB2838F428B4927B23D53817FA7D244BF71AA9E2D56
      34D930B24BA41F6DB841762C2C619129826767924327E44A45B69864D2A47C0E
      37A140B008587F89261B40B6E8226123BE42CCBEE8DBC67DF52096A4BFDEA68E
      1AF32C21C79EC240D7CB072AEA1BD8514E3B6C1C47186A11229839E2BA102384
      86696322F93EAA42842F1A3A4076D01242177C13136713FBD9EE62088231D038
      6741370799AD64CD744C3473C8416EF698059239EC80E05EB2756F5C173F4ED4
      6039908CA9A877EFDE3353912D5F83B988B0B37324A6F4ED1C4C14931357A39C
      C6C4102C8896028DA4790022C1EB306A260CC1F2DD68876EA6E681F0217EB366
      CD4A387E5093087AEE472E40306CAD51B0D39F389E024AD8361D5C18BC824283
      02AE41ECCB3DE4CA3530D38CC792AD3A75EA944844E11251C9C856816ED764D0
      B2D25E94F8D14F1C93B5221B13D71186088FEB043775118A9016A48C18F57B98
      3C1E987A6BD2C96671484BAE201E863D2B08DBB00EDA519930893266C818BD59
      B6119D900D9E11C756525C137208FE249E98EDA31A376EFC5E4A016F2557D584
      5CF94E06B3894F23648943C06A9ED9A7C47E2585860158884C42306E88D81242
      63B5866D2BC99AE9321D2F96C08E89EFC21F4376EC7CA05D64D428A05853C946
      347C705C6DC2847FB4EC58B2D5BD7BF791B21807242B3CF807A1090B1D2526CF
      3FE4497BAED29505A342CB87B051DB41C1DE260AEA649E325D446815F1294506
      4B002124141F724570DB2B8D777491DA9858BB39F0D1F6F43DAC14E38AEB8440
      AEC142E2BB2DD992716C1205DC5798FFAF61F9E902FD410D19D037627AFC2D78
      304172C4716A2FA7AE0637A911DF4142D0804CBF87C9A5064C1AD556AB583414
      0A7205168C848B024E0073B7DD1D3CC7035E610F9521CD0991CC2473950EB852
      1E289E0DB9C475741082F94468D31D933F7AF4E88EFDFAF5F3BBBFB901F2BB51
      CB82518079C1C4D9F652B499D815E292CD2AE733F8398AFCB6ED863836AE1DF6
      C1C3D0F0EF6216FDCC1E890D1A1AECE93EB83C165D1CE42A78BFB8345C90DDDA
      2A1664B98CC725A64AF1033E54B366CD4562D69AEB93B49CF2A38E711D5FC884
      6342B548A0805C6106D9DB936D0806DBC674A131B6D04F460AE2962B8207C770
      0F74586AD185460388A865DC986C42BE5C42A364C0CD219720D912A11F2EFC63
      6DD04C178889AC5558589870EE01A1111D09719A67B687F00B620A5827848101
      E5D227CDF531F12422AC16655A2E4C062C01F9659B6624758B0019377DD2C1BC
      3AC73BD01C1197F50B82F9C425D92A9A10D7BBA64E9D7A95FD255550201A345C
      58D8407D82A406C98D6CCFC40A423357ECD1B5652F4C2A7E92959F4BF31D0226
      5EA7301E6C0DC232048F8FC80698647B221F4C1DADC5EA104ED9CC959605D1B2
      7C1CBFAC9BCF826544B1925F7EF4D147D5844BFD9850401295FF444201FF57AE
      C996D0C794CFCC15805CD1E21A57133C66110B614D575C27DF05C9210B72E2C4
      89CE0AE193732D0B660AFD195C9A1F6D182763EA208A9340B618012CC075BEE1
      2B31CFACC2B8FC2FE48A89B6E533CC1B354EC299B8CE7164523915D7922DF557
      7134F661096C1609B34C36CD1E844A28887268ED3A5F4856469431BE2456AB85
      2D232260F8BE2BA042569874527E7108984401E40AA66B837312F29C60436F74
      5CAB1C3740A60CFF67F7EED0046F7D7FB608FE2A0B9A8AFBB17E9EFB64F1E66B
      6FB0458A32627561FE1F2AD94A10B09A530842AE02D6863B3A2FE84C54B0F228
      2C30A8383782F37D1408E88322E9A020CC09764B660372E02CD854A539325724
      5FF245AE824021F5CC138528CE9DD3A64DBB46C956DE04AC992B6EDAEE65A514
      47A181D361E23EA783B420B56BB4D866DFB8277C74AEA05A95ACA980854B6935
      97B260A6C0FDE9EF3029D8D222B2DB4F8F79C88B80955C9156B3138BC980A193
      7DB2263B4EF07D34E6DBC348E3CA6CB12869AC0F431C65C14CA13F8D4733A425
      5BE2023BF7EAD5EB11D7D3E6E541C05A16C45C921450505921EB0331C8D70F6C
      517427B345024581765146CCB4CB320CF8589B0B06F87F42A3B8335751801B24
      D4B4DB4A458196AC58B1C26D16CC8B80B52CA8BF3BA8C0349315E23BF279122B
      134E4C6C376E71BEB4E502D982FC7CF087AE286C50D3CEE709B3C990AC8CB87C
      F9F2231B366CF87EEC0256F34CC8C2BE5A05C286D6DB1F64CC07B48C481F95B5
      1E7165B6A810052793D3ED2057F93C3D2815C2CA883D7AF418217C6150EC0256
      7205D1E1EC0A050485BA6DBECCB305C512EE0361589349B62BB89D355370D696
      CD5C5116C43CC39CB715B9B248564614DFBC51347BBF5805ACDA4B8A904DD716
      D0799205C1332EF275D37C3F151DDBB3C5314A3684CA06C1BE69C81519B97C66
      AED22159195134B87DEC1A8CB9604F2D3BDD156CF8C66F655B16CC145A462406
      B7879FE55A46248D4BF7A742CB82FC9BCFDF758C72BF104934D8FE4A9A4414CB
      6215B0960529A15972459A92FEA65CCA829902A205C3A48C68F3DDB99C021FAC
      67A3B95C3FDB0356E2841EF34F95C9B8A5CDB10958CD33BBDA3B76F40F8773F5
      530800E427DF077406C7435CCAE634DBC1499863AB309980A32082FD5FDAB3B6
      BDA1677BE00A4DAAF4875202C65967936E232FCB1710EB969494F8CFA3B97423
      E65A16CC145A4624D313FCED237C28C2CF1441D743D2437F33627B43E716CE61
      C6B3B154B121F8DB7899009A1E3CB297C4069399CFB3B152817D416C20B33BFF
      A904D9102A2A767A01A3852403089E332DF66FFD59BC84BE60624F985D5C65C1
      4C41B29DC585DFB5648BFB631232B5283BAB80F336F3FCF0067D517196053305
      640BF2475C4EAD5BA13FD79709764A01D7AB576FF1CA952B9B667DE524207345
      5910C16EABF25918B48C4853BAFD2551B25DF62CAD28D829052C61CDEE428C16
      2D5FBEFCE438BF9042034DE2B4BB6CABD02819F4987FFACD94F152DB25774C78
      11153BA580B5BDE3D1471F3D43FCAEC862B78C4C361716DFBD59B4E30A0987CE
      D1E7897D31CFB0F2ED1D23C2EE298090BAD47E6622864C3B2F687AB7877FEF14
      02D6BD49B9E2CA2BAF1C326EDC38FF74F0E1C387BB1029D50F5C6C2B40AA30D5
      64A1743CF865C2377D2D1D9823C81A3B1A153B858061CB7ACE7F364C570F31BB
      E8A28B464D9D3AD5DFDBC4412B1CABB0A30A380EEC12F02E016F33EC12F02E01
      FFFF12B0DCF396C2C2C229E5CB97DF22AFA5CC786C3DBB73F3D2A54B5BAC5FBF
      FE787D7E9780776C017F2D8CFA00CA8A51D1B367CFFEF7DE7BAF5F4E2296DED1
      044C35699780FF17DFCE9F3FBF4AEBD6AD5D9F4D949FB92D2E2EBEFDA1871EF2
      7FDA94542C8D053B423549054CD7AA09FFFEDF0BB89A08F8FB7427C669182971
      FD080995FC40987AB3FE5EC2F6862E4E7EC6C7D411BEDF25E0AD0206C97E2C5B
      EFB14D9B36F73FF7DC731747FCDA1D02BB046C040CAC90F579B4032D7EF8E187
      4FEFD2A5CBB3DBFB7EA2A2458B16CFEC127040C040859CF043CB5B853C73E6CC
      D38B8A8A9EF6B6EEC8DC51D1AA55AB3942B8CEDA25E0100183E07CE84FE78055
      AB561D2A4CB5BC109B6D5FE44E0F575F68D8B0A16BFDCC9B80E95D62A319C5FE
      ED0DDD15C8E630F3E3524905AC3F7513F4C9B9FCB6C4F680DB5D982F01F3CB2A
      7451047FAD6B7B0001737F34A847113040C87CC6FEA298DEABFEC8E5F6AE92A5
      82864D4EC0FC877F731170D7AE5D474F9F3EDD3F8D84CE4CBAFEB767BFB08205
      CCBDB1B5D4B4947EF7FCF3CF5715ADFE3ED97D6BF8A431F24E29606E980988F2
      1B3C61D09B3EE38C33A6CE9B37AF6BC617D88E983367CEBE6DDBB6DD98F4A4D6
      8016EF94028E43C3B8F1B973E79E72E699672ECCF962DB0842B8EE7FF0C1072F
      AB50A1C22FBB049C061A42CC9A35AB45E7CE9D1FD9B2654BEEE7F9E611679F7D
      F623325677946C2AABF57F41C0FF032C26DB883E43EB2E0000000049454E44AE
      426082}
  end
  object edtusuario: TEdit
    Left = 248
    Top = 54
    Width = 156
    Height = 24
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnKeyPress = edtusuarioKeyPress
  end
  object edtcontraseña: TMaskEdit
    Left = 248
    Top = 83
    Width = 156
    Height = 24
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 1
    Text = ''
    OnKeyPress = edtcontraseñaKeyPress
  end
  object Btnaceptar: TBitBtn
    Left = 248
    Top = 123
    Width = 75
    Height = 25
    Caption = 'Aceptar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 2
  end
  object Btncancelar: TBitBtn
    Left = 329
    Top = 123
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ModalResult = 2
    ParentFont = False
    TabOrder = 3
    OnClick = BtncancelarClick
  end
end
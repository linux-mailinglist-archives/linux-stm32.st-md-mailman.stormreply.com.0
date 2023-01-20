Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBB1674F7D
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Jan 2023 09:31:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58D88C6904C;
	Fri, 20 Jan 2023 08:31:50 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6276C03FCB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Jan 2023 08:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1674203507; x=1705739507;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=LM21IujlS0c7/Pqo7heL7oYgkKIPVnizW2J9FSPp0CY=;
 b=EYNk5WntYjZueWjXSHs7wN25HS5ZaRAdP+AHw38XF5F5YrwCUC35lDYt
 uxDcn6YbR2vFbdulnNpHXxApI5ZnVjGFIuI3j2zem0rDEjVXbFdvn45Ne
 NTvPraqLolF7OnSrhmovNRc3T4Kr6l2Yg9hzFFIQ3jCkK1/4SxY2gJChC
 7bmGPmgEW6ufpJVR8tgIFaw+T58iK6+j8yee9b/3MbuMTIozRJiCI1eHR
 6Q1n08gbfHHJbWlo5FPrLelMNVoKvwsl0USVV/McP1nnlJIh6rt7CctKi
 qGv4tSHqKZ0nazVDxGl5l1/CUqCU/tX/LF3UFXCysbLTd10wcVNWyjqvG A==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669100400"; d="scan'208";a="133251635"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Jan 2023 01:31:43 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 20 Jan 2023 01:31:40 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 20 Jan 2023 01:31:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQapKJuGW9JqfHq90auZUMVRqHMdDoyoeGb6u+SHyoapXhJ90o/O0L3wv1wlg/UAo36N8X2lnPVzsOVD/qAT4pe+ksTDRrJ3TS9T3f6WPT0yzRHtWiA6gWPSgJDHv42+OesDY1PVdLWVPVZEPKyXHe37T3m/L+g0vR6k5lMlLcnnFnIhw3eNsx6TVKwVNQ9MpEs9SX6zb8G0pgFI+rAISFkjIk5tYtm2cKu/F6jccnbgmyP6JfdQHbnEGDVudwkhbpRnHhp2wiqRxoNFRaJUfTfs/gtT0rHx3MAqdH1iJyfkJ35rYpUHWftPqKAM0BhSHKwBQbby3JF5fBC55f0mdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LM21IujlS0c7/Pqo7heL7oYgkKIPVnizW2J9FSPp0CY=;
 b=iQCpB+M4/8PjFKHhR5Yv5SdWCv+Rvza3QtoHw94MW9yA3u+0d6yQ6UOSNY/0WVxvj5JbPnvfLOuBymUTzrniWjWLLCHmoPJdtmblqDkp43jneg5O6UvzpOTxVhQXbqfmgKIgcRlJuORF93KIj8L+nfi5uJ5qIBHVQzHO1G18GxXxJX30bqbKomi8NteA0Kn9XL5q21acrh/Rx3IfECPG6xxoEXY5OhJvfryblnYNDRMFq5zmxAY174pC2nTKjx1SOY1XLBEUfJT2eSjfU4IYt2F2M4vXkRK9P5zf+b3BM66vUNmCindgBPJvOTqyR0vJrRVHJoKVVYnX/RkeqvuooQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LM21IujlS0c7/Pqo7heL7oYgkKIPVnizW2J9FSPp0CY=;
 b=TmllAB5hpdpan2VyCw1gvOoEVQ5ZOZr2Rk2v4dliMdtCfafwgSzlp8zUkxr0CKysHrzG5BHUoDbMMeA4iRVi8fIPgY+fORdaS1zb6mlRJAVJv1pdpOb08UtnTU8442LSuZ2Wedq820u5Xw8V6l7rz0sqn1UALdro+g9A5itblbs=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by CH0PR11MB5252.namprd11.prod.outlook.com (2603:10b6:610:e3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 08:31:38 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::2177:8dce:88bf:bec5]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::2177:8dce:88bf:bec5%9]) with mapi id 15.20.6002.026; Fri, 20 Jan 2023
 08:31:38 +0000
From: <Claudiu.Beznea@microchip.com>
To: <krzysztof.kozlowski@linaro.org>, <lars@metafoo.de>,
 <Michael.Hennerich@analog.com>, <jic23@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <lucas.p.stankus@gmail.com>,
 <puranjay12@gmail.com>, <ddrokosov@sberdevices.ru>,
 <alexandru.tachici@analog.com>, <marcelo.schmitt1@gmail.com>,
 <renatogeh@gmail.com>, <Eugen.Hristev@microchip.com>,
 <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <ak@it-klinger.de>, <marcus.folkesson@gmail.com>, <kent@minoris.se>,
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, <alim.akhtar@samsung.com>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
 <linux@rempel-privat.de>, <kernel@pengutronix.de>, <nuno.sa@analog.com>,
 <nish.malpani25@gmail.com>, <rmfrfs@gmail.com>, <dragos.bogdan@analog.com>,
 <jmaneyrol@invensense.com>, <lorenzo@kernel.org>, <bleung@chromium.org>,
 <groeck@chromium.org>, <stefan.popa@analog.com>, <decatf@gmail.com>,
 <sean@geanix.com>, <contact@artur-rojek.eu>, <miquel.raynal@bootlin.com>,
 <tremyfr@yahoo.fr>, <alazar@startmail.com>, <linus.walleij@linaro.org>,
 <caleb.connolly@linaro.org>, <fabrice.gasnier@foss.st.com>,
 <stefan@agner.ch>, <daniel.baluta@nxp.com>, <harald@ccbib.org>,
 <ez@norophonic.com>, <preid@electromag.com.au>, <matt.ranostay@konsulko.com>, 
 <swboyd@chromium.org>, <navin@linumiz.com>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-fbdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <chrome-platform@lists.linux.dev>
Thread-Topic: [PATCH 1/5] dt-bindings: iio: drop unneeded quotes
Thread-Index: AQHZLKmcrVXALejg/kSFjYvE1tyWYQ==
Date: Fri, 20 Jan 2023 08:31:37 +0000
Message-ID: <1c39ee04-3568-0304-3497-95d3c7b1d16a@microchip.com>
References: <20230118184413.395820-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230118184413.395820-1-krzysztof.kozlowski@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR11MB1953:EE_|CH0PR11MB5252:EE_
x-ms-office365-filtering-correlation-id: 9d19417a-82ba-4ac2-a352-08dafac0bf7f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GEYqskX0CuBejEF/nQRy1gfdWlUTacwVYtXKkfpeIH2dr+B5dR6KQpbwV87mi+Q22zyZTmp7kw6aBk15nj3CHWQOQa86viCd0nlTAwUJcckXq16ssSaUZgXfhVL3iY7fxQ9vTggJo1tZJ6VJu7FY+cSGu1CtailE05BK4LyczS2l7DJiAjmAVZzF0wgOj+x6SNZhFEogiuUUnOspYV08oCNLIP9uhYIVQppDcJnLivjZGUxmiR1YIp4eAAi7nOIqJHwjldICkXAlVFMudlteZYMt+yRRPd6Q83ENEJRWJjA3A31P5GsUpdH3OybwcpbuSdOU94yfgYWfa498KDGzV8bjJmt0dZwAMi9MNfmbF1kq3Bjn5BUc/uJNpukwoVz3XX9mBYVC1Z1ofWrLd+QnYw2gk3wwJ9VY9ezzG0Mg9/+ZNjxHoSeBRWGmhCUZ54/A+4BjJJm3JyAFiJJFRlPFoXoljMFSL30PXfL8GgSMOOmmfzWjhZwAxgY05yMKuDyDyxUpf8QrnigVCE0rCACj044y7yvbpmMtr9QUCzslh3FZxWPxawTm5/x3azHSbSRM0i3ydhmTEJKdXl49N6zk3uIr0wwULu8rU6nYWhj7O3HEd7wybov2dtmvHCiJEVqxsDRorwyRrdSjRKeBw2jvaWQ5IUgZP3nyB9QHu3KWKbnwB7nys3Zx1Fu5jNSUjSxeLAq0v21U+f2wyKiUmbhCIgRCIuJPJptaOnqiLzjKrqY+q4oP74MuK+eEaH2SKK3Db5b6wRaGzB4Wugwi72dFIflhWPhZKOAUheU4u++LWaJWBlO50nF9LFKgMQpKZVuIBlOsK2GjpkmUwSYX9y+LQXztxXXCrn7t1kA8cTZZiiY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB1953.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(376002)(366004)(136003)(346002)(451199015)(26005)(2906002)(186003)(6512007)(110136005)(6506007)(53546011)(316002)(2616005)(1191002)(966005)(6486002)(36756003)(478600001)(71200400001)(122000001)(31696002)(38100700002)(86362001)(38070700005)(921005)(83380400001)(41300700001)(7366002)(7406005)(7416002)(5660300002)(30864003)(31686004)(8936002)(91956017)(76116006)(66946007)(66556008)(66446008)(66476007)(8676002)(64756008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RjRicm42ZC9UYnl6VFVxS1ROcUQ3eDNoeWYxSkRHOStneWV0c2tNNXIzWjJj?=
 =?utf-8?B?eDFjVngzMWxxMld4Q0FDb2E2MnpqOFRRY3lQK0Jlbk93ZFFZdG1zVGh3M0Qx?=
 =?utf-8?B?RW05U3RuWjg3aFNLMGRXWit5dDRHUVdiY3hSUG1HZEIySHUyYTE1MmUzZ2hp?=
 =?utf-8?B?VEtGNjhON0N5aG9Xd1ozOUV2VnZPNU9TVy9OTGxSWUdNSzFCdld1VHNKUXJG?=
 =?utf-8?B?bDB0ZDdEQXVIa1Q4SGdCMzZKeENaZTJsOEFDTDNKMWd0TUZzSXJBS1E2V0E0?=
 =?utf-8?B?VEVpQVZwTGMwQ0kyUEVZcm5uZzFYR2VnN1M5Q0dIYnJSM1VwQXM2MG56dlox?=
 =?utf-8?B?VFh5MkpKMG5BbWpFdmRPOFUrc2xwbFNxMWM3NEFOQ3dVdEl1Z08zZDRVT0oy?=
 =?utf-8?B?M2FyOUM1SnpNRGVrQm1ySHEwOU9UN2ZjMjh1a1M2NFdobFhsZE1PRlU0SU1l?=
 =?utf-8?B?bzdOa3hrOEk2OHRKNm1jNHJzbkVnYTgrTEVYS2lVOFRtY2JmNklnaDZtZ0NP?=
 =?utf-8?B?WkI2Z3c1WUdUWGdXRzU3N2d6MWJTRmlobkZHY2U5bFB3NnloSWEzV2ZBSHRK?=
 =?utf-8?B?eDNETDhseGZTRWpCVkVHZk55clNyU2ZzQndxRWFUTUVXNnBLTENxL2xpU1FH?=
 =?utf-8?B?RWNUZm8wamZmZ0hHUy9IV3BLdmNETEcvZG0rWmk2dEZyeFBuYktidWJYdC9K?=
 =?utf-8?B?Y0VFbVFJMzNuYUlYNTdmZmNmWU4vV2ZITHRoNFFHT0NnS2ErVVJoaWY4M0NS?=
 =?utf-8?B?RGx4NjE0enppZUdoRnZNM1FMZ1ZTTU5ZdEwxdWsyUFVEaVFhWlRDSEt2WlZh?=
 =?utf-8?B?eHF3a1lFN0h3SlVpVmYzaVVHUFhMMHo4RHczL0wvOFJpd294R0V6anpwNFFr?=
 =?utf-8?B?aDcrUzFydk13K0laOWdnSlhHSjBrOUpqaUNTWUdZb041N2hiYVFRa2tsODhJ?=
 =?utf-8?B?MlhQMTZ3UXJOMitKd2MxU3ZuTk9WcDlvbjZKeXRqZGlTT0I4YUZtOTBDenJO?=
 =?utf-8?B?eFJLODlybU9Bcnh2V1Yrbk90M3M2ZmREd3d0azhlVnVKa09SN0NoR0RqaU0y?=
 =?utf-8?B?cmNqV2VsL0xtVzZ0K3U0MENmKzd4N1NBNldGUXhZclVtdUNEbXQrNFJ1eVlV?=
 =?utf-8?B?UDZLRjlUaGlndmN6N2ZhdDd2a2NxcmdLRHI2TytYYzlkR3BSQ2tXRHhERFBj?=
 =?utf-8?B?czhuSXhlOFRiem4vTVc2S3kvQTI2RDMvRi91OW1USmRZK3hhQWo1bXl6dXds?=
 =?utf-8?B?LzFGYkg1SGZjRVZrYWJDdUlqdHQ1dW1Kd24zdnk1MS8zMTVvU0pYZE1KMng1?=
 =?utf-8?B?cnU0UHFDc21CdEZyaG9NOUM5Y2QyTmcra0pKem1DNzBZVzFZWSs1cExIOFo2?=
 =?utf-8?B?UUVGWFBEWW9MdDNSWVpZbXBMZFptZmcrVkljUk5wOW9INVMrZDUxS0NmYU5R?=
 =?utf-8?B?UGVWMTN3Qi83WVpDZ04yS25rQzZrOXA5WUMyWDJEdnJrMCtPeStKallvZFZR?=
 =?utf-8?B?Zit4WUx4d3drK2Qrc0NiWjExVnFnUERuWm4vT0dDVjJRbStUa1NHSHJJZzBM?=
 =?utf-8?B?RDRDTHd1Wm83T1dqdzYwWkUrNWtwRnRJSGtuZ1FqL01ublRrdWpHeTlTdFUr?=
 =?utf-8?B?bmFsQ2swN24zMEpUcWI0a3NNdWtwZDdpVlIxQlNFVytYT3Btb3lDeVRLWm9l?=
 =?utf-8?B?clRaRW1DNzNjSHRBMkxCNG5VV0FNd29wLytyUEFCTm81cEY0by9jUmpzTllH?=
 =?utf-8?B?Q0RRQ0Z3MTZ3Q2NQMlp1SUtYcWtiTUtubG5yOWhnRk1aenlld0V2amE2bnlI?=
 =?utf-8?B?cHlIbU9saStDZlAwVlVLN2RmOUU2R0RXTWxsU1VjTkVJWitEZUxnSU9PSlJF?=
 =?utf-8?B?YzBJQ3RNdC9Fc2xPWmV5SVMzeUk2MGNqdEdERU1GRnJnYXNsaTNTMkxuWXVM?=
 =?utf-8?B?eTYwMnhnbkt0TmR4SEZyTjN0bHFuV2RucVRNVmJDaThaR010Sk5SRlNqWlFn?=
 =?utf-8?B?OGJGaEM0ZjFUai8xbTdkWDgrNC83eUtSZk9Cd3kwWHdrOHlON3N6Ui9VU0k2?=
 =?utf-8?B?eTRZdEV4NGJzTHRKbkVnOGp6UDg2cE95NVFGSHlqNk1sTThRUXpxTDd6MVVN?=
 =?utf-8?B?WGRkbm9EN2F3aDY3dmJMdEZ1blZaaGdkR3dkSkRFU2ZIOG8wVGVMam5mdHUy?=
 =?utf-8?B?Ymc9PQ==?=
Content-ID: <24EF58E3628B804F8F04ABAC4CA07EA4@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d19417a-82ba-4ac2-a352-08dafac0bf7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2023 08:31:37.9355 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DzHgcZI2fKWA3D469s/+ECqgexWonyCbU2u0Hp9yfiBlHF/8l/yQ6DonGb/19VnbONkJU3zRiVksHRUe41ADLkbmxaJaxqnRfjTbp48JtB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5252
Subject: Re: [Linux-stm32] [PATCH 1/5] dt-bindings: iio: drop unneeded quotes
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 18.01.2023 20:44, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Cleanup by removing unneeded quotes from refs and redundant blank lines.
> No functional impact except adjusting to preferred coding style.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/iio/accel/memsensing,msa311.yaml  | 5 ++---
>  Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml | 2 +-
>  Documentation/devicetree/bindings/iio/adc/adi,ad7292.yaml | 2 +-
>  .../devicetree/bindings/iio/adc/atmel,sama5d2-adc.yaml    | 2 +-

For atmel,sama5d2-adc.yaml:
Reviewed-by: Claudiu Beznea <claudiu.beznea@microchip.com>

>  Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml | 4 ++--
>  .../devicetree/bindings/iio/adc/ingenic,adc.yaml          | 4 ++--
>  .../devicetree/bindings/iio/adc/microchip,mcp3911.yaml    | 4 ++--
>  .../devicetree/bindings/iio/adc/renesas,rzg2l-adc.yaml    | 2 +-
>  .../devicetree/bindings/iio/adc/samsung,exynos-adc.yaml   | 2 +-
>  .../devicetree/bindings/iio/adc/st,stm32-adc.yaml         | 8 ++++----
>  .../devicetree/bindings/iio/adc/ti,ads131e08.yaml         | 2 +-
>  Documentation/devicetree/bindings/iio/adc/ti,tsc2046.yaml | 2 +-
>  .../devicetree/bindings/iio/dac/lltc,ltc1660.yaml         | 4 ++--
>  .../devicetree/bindings/iio/dac/lltc,ltc2632.yaml         | 4 ++--
>  .../devicetree/bindings/iio/dac/st,stm32-dac.yaml         | 4 ++--
>  Documentation/devicetree/bindings/iio/imu/st,lsm6dsx.yaml | 2 +-
>  .../devicetree/bindings/iio/temperature/ti,tmp117.yaml    | 6 +++---
>  17 files changed, 29 insertions(+), 30 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/accel/memsensing,msa311.yaml b/Documentation/devicetree/bindings/iio/accel/memsensing,msa311.yaml
> index 23528dcaa073..d530ec041fe7 100644
> --- a/Documentation/devicetree/bindings/iio/accel/memsensing,msa311.yaml
> +++ b/Documentation/devicetree/bindings/iio/accel/memsensing,msa311.yaml
> @@ -1,9 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> -
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/iio/accel/memsensing,msa311.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/iio/accel/memsensing,msa311.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> 
>  title: MEMSensing digital 3-Axis accelerometer
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml
> index 75a7184a4735..35ed04350e28 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml
> @@ -61,7 +61,7 @@ required:
> 
>  patternProperties:
>    "^channel@([0-9]|1[0-5])$":
> -    $ref: "adc.yaml"
> +    $ref: adc.yaml
>      type: object
>      description: |
>        Represents the external channels which are connected to the ADC.
> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7292.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7292.yaml
> index 1bfbeed6f299..7cc4ddc4e9b7 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adi,ad7292.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7292.yaml
> @@ -43,7 +43,7 @@ required:
> 
>  patternProperties:
>    "^channel@[0-7]$":
> -    $ref: "adc.yaml"
> +    $ref: adc.yaml
>      type: object
>      description: |
>        Represents the external channels which are connected to the ADC.
> diff --git a/Documentation/devicetree/bindings/iio/adc/atmel,sama5d2-adc.yaml b/Documentation/devicetree/bindings/iio/adc/atmel,sama5d2-adc.yaml
> index 31f840d59303..4817b840977a 100644
> --- a/Documentation/devicetree/bindings/iio/adc/atmel,sama5d2-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/atmel,sama5d2-adc.yaml
> @@ -41,7 +41,7 @@ properties:
>      description: Startup time expressed in ms, it depends on SoC.
> 
>    atmel,trigger-edge-type:
> -    $ref: '/schemas/types.yaml#/definitions/uint32'
> +    $ref: /schemas/types.yaml#/definitions/uint32
>      description:
>        One of possible edge types for the ADTRG hardware trigger pin.
>        When the specific edge type is detected, the conversion will
> diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
> index 77605f17901c..9c57eb13f892 100644
> --- a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
> @@ -1,8 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/iio/adc/avia-hx711.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/iio/adc/avia-hx711.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> 
>  title: AVIA HX711 ADC chip for weight cells
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/ingenic,adc.yaml b/Documentation/devicetree/bindings/iio/adc/ingenic,adc.yaml
> index 517e8b1fcb73..b71c951e6d02 100644
> --- a/Documentation/devicetree/bindings/iio/adc/ingenic,adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/ingenic,adc.yaml
> @@ -2,8 +2,8 @@
>  # Copyright 2019-2020 Artur Rojek
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/iio/adc/ingenic,adc.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/iio/adc/ingenic,adc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> 
>  title: Ingenic JZ47xx ADC controller IIO
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/microchip,mcp3911.yaml b/Documentation/devicetree/bindings/iio/adc/microchip,mcp3911.yaml
> index 2c93fb41f172..f7b3fde4115a 100644
> --- a/Documentation/devicetree/bindings/iio/adc/microchip,mcp3911.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/microchip,mcp3911.yaml
> @@ -2,8 +2,8 @@
>  # Copyright 2019 Marcus Folkesson <marcus.folkesson@gmail.com>
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/iio/adc/microchip,mcp3911.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/iio/adc/microchip,mcp3911.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> 
>  title: Microchip MCP3911 Dual channel analog front end (ADC)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/renesas,rzg2l-adc.yaml b/Documentation/devicetree/bindings/iio/adc/renesas,rzg2l-adc.yaml
> index 8b743742a5f9..ba86c7b7d622 100644
> --- a/Documentation/devicetree/bindings/iio/adc/renesas,rzg2l-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/renesas,rzg2l-adc.yaml
> @@ -69,7 +69,7 @@ required:
> 
>  patternProperties:
>    "^channel@[0-7]$":
> -    $ref: "adc.yaml"
> +    $ref: adc.yaml
>      type: object
>      description: |
>        Represents the external channels which are connected to the ADC.
> diff --git a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> index 81c87295912c..e27d094cfa05 100644
> --- a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> @@ -52,7 +52,7 @@ properties:
>    vdd-supply: true
> 
>    samsung,syscon-phandle:
> -    $ref: '/schemas/types.yaml#/definitions/phandle'
> +    $ref: /schemas/types.yaml#/definitions/phandle
>      description:
>        Phandle to the PMU system controller node (to access the ADC_PHY
>        register on Exynos3250/4x12/5250/5420/5800).
> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> index 1c340c95df16..995cbf8cefc6 100644
> --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> @@ -1,8 +1,8 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/iio/adc/st,stm32-adc.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/iio/adc/st,stm32-adc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> 
>  title: STMicroelectronics STM32 ADC
> 
> @@ -80,7 +80,7 @@ properties:
>      description:
>        Phandle to system configuration controller. It can be used to control the
>        analog circuitry on stm32mp1.
> -    $ref: "/schemas/types.yaml#/definitions/phandle-array"
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> 
>    interrupt-controller: true
> 
> @@ -341,7 +341,7 @@ patternProperties:
>      patternProperties:
>        "^channel@([0-9]|1[0-9])$":
>          type: object
> -        $ref: "adc.yaml"
> +        $ref: adc.yaml
>          description: Represents the external channels which are connected to the ADC.
> 
>          properties:
> diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads131e08.yaml b/Documentation/devicetree/bindings/iio/adc/ti,ads131e08.yaml
> index 55c2c73626f4..890f125d422c 100644
> --- a/Documentation/devicetree/bindings/iio/adc/ti,ads131e08.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/ti,ads131e08.yaml
> @@ -77,7 +77,7 @@ required:
> 
>  patternProperties:
>    "^channel@([0-7])$":
> -    $ref: "adc.yaml"
> +    $ref: adc.yaml
>      type: object
>      description: |
>        Represents the external channels which are connected to the ADC.
> diff --git a/Documentation/devicetree/bindings/iio/adc/ti,tsc2046.yaml b/Documentation/devicetree/bindings/iio/adc/ti,tsc2046.yaml
> index bdf3bba2d750..32c52f9fe18b 100644
> --- a/Documentation/devicetree/bindings/iio/adc/ti,tsc2046.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/ti,tsc2046.yaml
> @@ -41,7 +41,7 @@ required:
> 
>  patternProperties:
>    "^channel@[0-7]$":
> -    $ref: "adc.yaml"
> +    $ref: adc.yaml
>      type: object
> 
>      properties:
> diff --git a/Documentation/devicetree/bindings/iio/dac/lltc,ltc1660.yaml b/Documentation/devicetree/bindings/iio/dac/lltc,ltc1660.yaml
> index 133b0f867992..c9f51d00fa8f 100644
> --- a/Documentation/devicetree/bindings/iio/dac/lltc,ltc1660.yaml
> +++ b/Documentation/devicetree/bindings/iio/dac/lltc,ltc1660.yaml
> @@ -2,8 +2,8 @@
>  # Copyright 2019 Marcus Folkesson <marcus.folkesson@gmail.com>
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/iio/dac/lltc,ltc1660.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/iio/dac/lltc,ltc1660.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> 
>  title: Linear Technology Micropower octal 8-Bit and 10-Bit DACs
> 
> diff --git a/Documentation/devicetree/bindings/iio/dac/lltc,ltc2632.yaml b/Documentation/devicetree/bindings/iio/dac/lltc,ltc2632.yaml
> index b1eb77335d05..c9e3be3b5754 100644
> --- a/Documentation/devicetree/bindings/iio/dac/lltc,ltc2632.yaml
> +++ b/Documentation/devicetree/bindings/iio/dac/lltc,ltc2632.yaml
> @@ -1,8 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/iio/dac/lltc,ltc2632.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/iio/dac/lltc,ltc2632.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> 
>  title: Linear Technology LTC263x 12-/10-/8-Bit Rail-to-Rail DAC
> 
> diff --git a/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml b/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml
> index 0f1bf1110122..04045b932bd2 100644
> --- a/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml
> +++ b/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml
> @@ -1,8 +1,8 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/iio/dac/st,stm32-dac.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/iio/dac/st,stm32-dac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> 
>  title: STMicroelectronics STM32 DAC
> 
> diff --git a/Documentation/devicetree/bindings/iio/imu/st,lsm6dsx.yaml b/Documentation/devicetree/bindings/iio/imu/st,lsm6dsx.yaml
> index 68b481c63318..decf022335d8 100644
> --- a/Documentation/devicetree/bindings/iio/imu/st,lsm6dsx.yaml
> +++ b/Documentation/devicetree/bindings/iio/imu/st,lsm6dsx.yaml
> @@ -63,7 +63,7 @@ properties:
>      description: if defined provides VDD IO power to the sensor.
> 
>    st,drdy-int-pin:
> -    $ref: '/schemas/types.yaml#/definitions/uint32'
> +    $ref: /schemas/types.yaml#/definitions/uint32
>      description: |
>        The pin on the package that will be used to signal data ready
>      enum:
> diff --git a/Documentation/devicetree/bindings/iio/temperature/ti,tmp117.yaml b/Documentation/devicetree/bindings/iio/temperature/ti,tmp117.yaml
> index 347bc16a4671..c4f1c69f9330 100644
> --- a/Documentation/devicetree/bindings/iio/temperature/ti,tmp117.yaml
> +++ b/Documentation/devicetree/bindings/iio/temperature/ti,tmp117.yaml
> @@ -1,10 +1,10 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/iio/temperature/ti,tmp117.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/iio/temperature/ti,tmp117.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> 
> -title: "TI TMP117 - Digital temperature sensor with integrated NV memory"
> +title: TI TMP117 - Digital temperature sensor with integrated NV memory
> 
>  description: |
>      TI TMP117 - Digital temperature sensor with integrated NV memory that supports
> --
> 2.34.1
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

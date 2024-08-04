Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 324A7947089
	for <lists+linux-stm32@lfdr.de>; Sun,  4 Aug 2024 22:50:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0EDEC7129D;
	Sun,  4 Aug 2024 20:50:18 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11013060.outbound.protection.outlook.com [52.101.67.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70213C71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  4 Aug 2024 20:50:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lMQOarNoXx52KKrpAFAwEKQGVDMp4DcNTfklNsSEKi2jVPzr0wrk2uh2lrPiDEyQ3TtjmrfAGcFvThiSBkTB0FzvVVIIaVIK0I2W5daxLgx2j3rdyQJNBBuXa7wVyu/UZSMkWIHVYRH1dODXc6KpyqptCFKnNGkphJ2TAYLHHUmyWof345AusauuEHG63dP3UVs/xaVe694qDZPxAx5Pj3ECV/bucHh6qIPxfzYc4N7snd9WB3nR0voO3K1hS+pFKrz/FCMmxsgf4lmANDsxZwr6MrgzCxy6WG0+hgiGsoL77zBEE4PhY+g6GCWvmCPndABSpbhhGFcQBdJ+N5N3wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1RqbJkS1ALvlAiZP0DPN7NVCEUCR6eZP6/J+2+h7w9U=;
 b=P26AMyZeT8uqWXFDnjJfClVN3Y3PonZj6n9+r4oXy7BABQ3gtjPpEOIe268bxoSfbmftsecS4NRxD2VbRnnnkiyIxs3zU+ldDGmODS08FLMyzdeOqfavYkg9HW5ZneUv7fe8+bcJeokHPq117Zl+/5SWg9UBqz1ZqO7OcLFwfk4MHf56xbaxqbPfoBzoS0kiW2+LBF9rTs7+lhaBTi3oWaITMW+WKj6L0YZ7tHwCtjHsMVq8+ePmAzG9Cnku6z+tD0oLN+g00labqwY8lcMrQ55xGxU+eX0pH+s0yTpSERpn1ipp4hzohZ78JBXJ22hMY9nUPn8/Gcy+I0PT7+0Bdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1RqbJkS1ALvlAiZP0DPN7NVCEUCR6eZP6/J+2+h7w9U=;
 b=n18eUpA3bEmRAwjIjWP3e4Y11mQ1ADx8uBlKoXwx/ZQI+mul3qgBcEroTgux9yFPcBzUjAWhMDHtb2/+pPZHlEWlrPAGMMU7nCUb/jsE7lE3pkg+0AS3HhD3eRPZQ22WauP/kNNRmmfeiUhraH3qSlEYKlk+UDQYiqE0dgKRwrJhBAgan4QtwxJ5Xfa0Ka4PMIORBG2xb5D5PLtZhUvB1MEdxIvyQbOhKrr7EWAk2m2y3J+0jMxvi6YotLQRHQopb8nXK0EvqmSCkfELCuKUWTpsPHnvcTHmGHLmC0fH+IQk0Z8jEk36VBWteWMVgWyq0ccovpp+s/i8jZwBkHwspw==
Received: from AM9PR04MB8506.eurprd04.prod.outlook.com (2603:10a6:20b:431::16)
 by PA4PR04MB7965.eurprd04.prod.outlook.com (2603:10a6:102:c9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Sun, 4 Aug
 2024 20:50:16 +0000
Received: from AM9PR04MB8506.eurprd04.prod.outlook.com
 ([fe80::5f7:9bab:66a3:fe27]) by AM9PR04MB8506.eurprd04.prod.outlook.com
 ([fe80::5f7:9bab:66a3:fe27%4]) with mapi id 15.20.7828.024; Sun, 4 Aug 2024
 20:50:16 +0000
From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Thread-Topic: [PATCH 5/6] MAINTAINERS: Add Jan Petrous as the NXP S32G/R DWMAC
Thread-Index: Adrmrb+HT24CeNXCTAuMlJKgRTqONA==
Date: Sun, 4 Aug 2024 20:50:15 +0000
Message-ID: <AM9PR04MB850646DD0C21DE38A6B4D232E2BD2@AM9PR04MB8506.eurprd04.prod.outlook.com>
Accept-Language: cs-CZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8506:EE_|PA4PR04MB7965:EE_
x-ms-office365-filtering-correlation-id: 23906f19-f664-48e1-b2ed-08dcb4c70b43
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?b9IVnrcPKq49SXOuXPth4wgXX7ZGfHnil72DLrLxA6cj2SUyoYqItZdT0Whh?=
 =?us-ascii?Q?LaiJrJGcYSvrBXu+jKibGISfMl3U+RjfcLJoZUd6JBonRLRWjKxlKHo4/U0j?=
 =?us-ascii?Q?aPiRJGfa03xLY1FdGBMZbh7+LqFkNDu2X17oNh6pazs2ssmjMEmVvYvRzYNV?=
 =?us-ascii?Q?31dzsUlwBpvBL+tpYPNeJ5QRYRP1Oz0b2ae50TVFtC+z7wZ8gZwOvA9XLAzX?=
 =?us-ascii?Q?RxjGXMcSuq/qY2iavQIrhLglGlC9LBYBqsXK0LDjZSgQ2DaAfIBK2J6dT9tX?=
 =?us-ascii?Q?vLbKpslTKd8HY7Yu//EOFXNMYl1PDxqMPjWp9bzbuIZbm/xaX4dAlbu2+82c?=
 =?us-ascii?Q?Zb8bAJS6aHIMvWFR5ApkqQ6A4ES5QXqKkJbozvT39axw9jMemwR5r/HG8iL+?=
 =?us-ascii?Q?Ot9tIjQoiypvRagA6tp2gmhzR7W/TGG+q8PxTnQQjdduCtHiZibBhH6yVeJC?=
 =?us-ascii?Q?Cz0UcirHN17Ksqxue+bBGT3r8+Ngi9JcWk2GwqcxjPx9BXVSO8oLaw9THLR1?=
 =?us-ascii?Q?WjYcPlaa5r3/0YROSKaTv0+niSZYC+Z2HLYKp8MjOp3RHxxOeIGg1rjk7J0r?=
 =?us-ascii?Q?/Xk25SH+IPd3n9/htpC/4LV2/81xtfkFjLGYXcj/Owc7i4TKffUbPEtCWNj0?=
 =?us-ascii?Q?rDnGexelQ5GSHSoAWsShq0/86BWP5ytP+CNaDma6ktQLmyGTFRIyG8qXSm1+?=
 =?us-ascii?Q?inwbEcV79vYJLZxbz2Ugz0J3xrn+TYlwp29GtFmbDKeADCOcw5fnbbLayVOj?=
 =?us-ascii?Q?KoswVdFNTcyhcDnNBHUPZ94ezhh6m0Pc/nb8H/pWZz4eUCil86jaZbDjbeCw?=
 =?us-ascii?Q?gqWhW3SPpY8aaQhQO9VdHbauakQuVp+pV3ejBPqixenv0FQ5RPcRUIKqyQ6+?=
 =?us-ascii?Q?199X5sFMSS3v4nfy7x/fISh2Urs4ER2d8oKH8szRmH7Ne5woXRF02SbhuRO6?=
 =?us-ascii?Q?y4Ngu8j3ayI8v0b0LyyfSxtRWUpXdN6tgHlusuPKApUr/GMMFhxPGYxJcpw2?=
 =?us-ascii?Q?Legv6u9QWJHa9Tegavxwruq9QPk2diJoZlkeX9AfUwE7Ae7S58qEwb+AMPgx?=
 =?us-ascii?Q?3VvhMhNd2/Q9phiu+o5nA9t6WPryMf77GRh0Yxs/1MC9sqyBrI2kxCbVd/qv?=
 =?us-ascii?Q?iCvsyy+i+kkT+llWLyI6juxHITojpsmizVm94TpydDEPq8mPRq4rHcpxIvy5?=
 =?us-ascii?Q?wzcGng1y3kd7+n4AAXPsbM89TZ8xPGMmR5Y2tftd/gyPw8qIPF/nAmClYFo8?=
 =?us-ascii?Q?5rHl8DV8wO43e/UjCqothWbB3bo2ojxMyXY/aNjGX3/4yT5mZWiXJer/w7ma?=
 =?us-ascii?Q?KFDHOv39p4gUp42hESj50J+XhSVsJK5BMNGGLC/kCFtq9SN0OmG6GPsP5PT2?=
 =?us-ascii?Q?ogMaG2hwGAjshfgml9oVEmCTQLHEfe3eSTFylMM8eWOCxzZqyA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8506.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HjcwcX3x6HcWvU+GtIejANIQ61FzMMQBKC5AG7lZEKY7/Ze3Y3TNUXGHi3zT?=
 =?us-ascii?Q?bs0nEgJW7MKpS1PCFtdUysiiAG6HzVM3UpYpeqUHfjo9PDSrTTnAECxKKaf0?=
 =?us-ascii?Q?PXz440rxTxzf3tkO9NLGW5h1Wp23DAVrfsd3bFzg8Gjz0S1DjF7IsKssQTs7?=
 =?us-ascii?Q?rgDBOJ01cuphsRojFzxPRae/kiUn0LYp9nHiUFbV4rK7tPV/2CkhDa/IJ9JN?=
 =?us-ascii?Q?J1EIO3VFEVHiva8dgkYZBQWTbmuC8f0YEMxnk8JDNrJsepcZIpZjgnb6QUu1?=
 =?us-ascii?Q?kTX43FjzKx5Zbqz6QMG4vHZZsFBGGlQ5WZGDw5moxar60UwvygYPSJoXWylL?=
 =?us-ascii?Q?jE1S3npwnJeVwiVwECeFQjPoTvp+OzPJNEHyORWu/4RiohgJLearp01kEWSR?=
 =?us-ascii?Q?2I0LAlvWicyvz9XysxXlGoImvA/Cw3/Brfxul3aVOxkoG6dVv0L+Y40ABNnO?=
 =?us-ascii?Q?Jva7iI+DIDACMRVE0o9MBZEKIvVcshZERUpw+u7D8FPhdmCBkpI0wLSgY6cQ?=
 =?us-ascii?Q?CH64sTqm05t57jHGduMvHotLozcsi+8/y/WR7SdSws/o4VBnq82tH5DXaGRi?=
 =?us-ascii?Q?NC2spURQJWbIFquSTBsnw/Q2gx0/vhV873iawbXrxa901QBWlDURLDv+Hzrr?=
 =?us-ascii?Q?dJyAmp1CqgQ9lKXDacRoBq/5qUQHKUxNL5cmYduJIWhGshgFMiCukIHujSW9?=
 =?us-ascii?Q?73LOZp6m6YSViaL5O3WZG1NS8sDunLfpPNOmRPmcLxGZZnCSa5ZzSrQbruN+?=
 =?us-ascii?Q?55c1Ioiox1LLhKkwASOu9WWTiHq1Tm1x4GjdxUXfw4DPUL7vQwkm1cDRVF/z?=
 =?us-ascii?Q?LJQcHf0b3eNYIt2HTRx288U5Jd34OsOlYkaZT9p8ABN2sjCe+tc3L+dMK3Xq?=
 =?us-ascii?Q?p0XSvfF7Q0N9X+ENqNBQhrkqziDpKMVT9mvB1eoS3MqXCxvVDwtoI0+3Viwe?=
 =?us-ascii?Q?ea8MpA5bqsxrvhB8bjYIK8ciA/pDCKw+hjsCQfzYRZQ+Q/SWMr/7e0KNzCKu?=
 =?us-ascii?Q?ZdSe743y31ehBNNxwH3XtFU9eAayElEg7dIk7k6LvfWcR16AhgLS7HOOIzoF?=
 =?us-ascii?Q?Kf4JvAeGIokfKsX8jbWgFHqd0S1IdMjNDW5t5cfTuLYlBJGjFfQNr2/ztRul?=
 =?us-ascii?Q?wrhoH+JNE7fUuy4dqMVE2oyCB/SF17kk6ztMsPIj4hbGh34ukap6WG2F8yOz?=
 =?us-ascii?Q?bgUrfu6mYLXNZU2AerYQyOR6uEWn8fN/8r5kIV//XiSYhbBWQSocR1D8vbv9?=
 =?us-ascii?Q?0t9dXSHYYOhFEp/pB6lDCKgnU4IvF73cz/6sSiTxpCy6tbgFnFsU7DWtPqpB?=
 =?us-ascii?Q?Z3fi31U5b2nkqi0UqWK/F+/7igxzA6DC5thSAS4qY0+Ikavh9GDZmFGJyID/?=
 =?us-ascii?Q?fmMuX4Jj9jyuMWjQaqfRpGmGWMR67mnv1YIChHEZC4OnbudkEh1ZNO/o/X+O?=
 =?us-ascii?Q?G17YV3lt6xYlodtPHuCCuuURxuPpKWs7ESC3TItA5ReXBREyvg1+8Hd0DJL2?=
 =?us-ascii?Q?+feAG5zQf7j3e+5fQdm81/w6PJtfvcWvusuj2aD3kV1PovspvXxNrsVmGpwP?=
 =?us-ascii?Q?/1gPqcmq8smozCTMWBZpMLZ0p3E/8f+0x2+Lc2tM?=
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8506.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23906f19-f664-48e1-b2ed-08dcb4c70b43
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2024 20:50:16.0067 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xMnhEzLNeo6jwMSf1C0BiWvd7gxosqTooQhRctK/yYtAs1MyBZhg47+8IfZ9PZE5QSwZeQWlzYVfoUkd+QSxbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7965
Cc: dl-S32 <S32@nxp.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] [PATCH 5/6] MAINTAINERS: Add Jan Petrous as the NXP
	S32G/R DWMAC
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

Add myself as NXP S32G/R DWMAC Ethernet driver maintainer.

Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8766f3e5e87e..16178a647492 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2692,6 +2692,13 @@ S:	Maintained
 F:	arch/arm64/boot/dts/freescale/s32g*.dts*
 F:	drivers/pinctrl/nxp/
 
+ARM/NXP S32G/S32R DWMAC ETHERNET DRIVER
+M:	Jan Petrous <jan.petrous@oss.nxp.com>
+L:	NXP S32 Linux Team <s32@nxp.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/nxp,s32cc-dwmac.yaml
+F:	drivers/net/ethernet/stmicro/stmmac/dwmac-s32cc.c
+
 ARM/Orion SoC/Technologic Systems TS-78xx platform support
 M:	Alexander Clouter <alex@digriz.org.uk>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

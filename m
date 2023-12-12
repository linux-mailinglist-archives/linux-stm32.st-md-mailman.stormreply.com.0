Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8248B80ED09
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Dec 2023 14:15:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36FD0C6B47F;
	Tue, 12 Dec 2023 13:15:59 +0000 (UTC)
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com
 [148.163.158.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1208C6B47D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Dec 2023 13:15:57 +0000 (UTC)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
 by mx0b-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BCBWuHi021687; Tue, 12 Dec 2023 05:15:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-transfer-encoding:mime-version; s=
 pfptdkimsnps; bh=lvWdXRvohYX7Gjf+Zl5w7E871KRB3M0cWyG31/oXekc=; b=
 eRiE4kdgNdIqnqLqhGg4sVjtl2GNRI464XCv2r9eRZ5hCcXgMNQyJ/d0JNlL4xw/
 xkGd0Z3VMmBAIEBOaKyjIN5K190jJ+6t6ROonRwRuVgf9qxZM5br0AZnb22si3PG
 4sxsQcbOYlQ0BvvZhiObVgearc96a8aYzcNANAu2h+xKcUYD0dhYM4BSl5e2MU5/
 MBi3IsqACUxpZ9RsZrXzdRqMMBSPXvOGxhKcTvuikmE9zjH5ChMPUa3kuliJtjhC
 yvo63Xdby3yw1q83rW1eRKAGFCPy+JyMeLFztSOhttWlWbPWO8N9TqR/SXyz5kQV
 M4TR00H5FEYSUsdxxtvzTg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3uxd5936g6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Dec 2023 05:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1702386917; bh=lvWdXRvohYX7Gjf+Zl5w7E871KRB3M0cWyG31/oXekc=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=dNO3RqAw//KHGLCs1dmP9WA3X4rw6W/61zfCpSsnrsrvEwPZ40YSrfX1OESuW9GpN
 rOrUZwZ8whq0nuTaa6ImEwaef2IsQmuQjUbmnW1BJSeB/XP4TLsAM5oFv0sOuyU7be
 RbzUzSt3nwH8P82OQKRyawJHhoDuLcwLduTGlODfC/YoGGicDNrFJYQvlqTJPXZ51Q
 9Gm2kPimMx+rCRRJwJB3VDNKtm6bLgtmAIWfxcexUSsF8x/a8oKSZukMR53kMAfyt8
 Ril81q0UKX34Ld+bKfSwJZPBY5LZiIWWlWGh4U2mLbvQuhEM1IiuiuKfGl+CwIGke2
 SddwacubhMg4Q==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits)
 client-signature RSA-PSS (2048 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3860540141;
 Tue, 12 Dec 2023 13:15:14 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id DF459A00B1;
 Tue, 12 Dec 2023 13:15:13 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=S5Khrrph; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9195E401CE;
 Tue, 12 Dec 2023 13:15:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ReLWL34J5aToCDuAO+uClnqRZVftnZoYIy8aIahSYs8jKQiV9dh4DfIEefquID8K7eNozxUoFmcfMQ5rvvZeX4/TvTy5FDTxiS8BDQ7R3YhpIdQXPBMdQx77WqY8X1VVLFaWZ8ZhAVzmwEjCv5GW46XbkPGOJGJesDFGEtyTfmXiFdOtJNVcrHc8y/OOVzeSwN6dbGG0CeX7tZejTT3aFk9BmdKvihqV/RYzDjRhkJNqzGhbUSYNfxoDayx4lVW0oAlIvifQXmdCpQpLrbDrNbYREPEsC9ChbyZWxlBdjUTqtCSLRibYH5IA4TZLZAp6EEx++3roAXIc2NQO8kk9xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvWdXRvohYX7Gjf+Zl5w7E871KRB3M0cWyG31/oXekc=;
 b=BA9uhP/l3yzCxxumvU+BTbSfrVW9icn1Kt70OgMeMgEvog/wilQmnowbgUgHLP53lju8qQCy62+E0UJ9B4GlJBBMgdwPNhPJSVsMLKi0D+zdtjPk5Z0z2Hl5zRRoB9joM1OnSKgkguUMtdv+P7R7gIG0L8a92ykMF9n88CMPHd+u1efvQEAwU/yWwUVoAYHachQUBu53tPwejRoepYPthZPglskgVKCgUQr0ZyEbEs0EnrO5ZwThl0BQjbVbmdoqEWrlRxC6KAuYCSRsbRsRKbzd2wKjbQ9g3LDW5wA6gh9g4Mx06mW6rbh5frY0ZGPas83b4+VUND3WXU2Z7/YWUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvWdXRvohYX7Gjf+Zl5w7E871KRB3M0cWyG31/oXekc=;
 b=S5Khrrphah3cA3OXgKh2b2ZhgIVOq4o0xLY+7DRu/FeIl2NY6QwrT5VFopxZRkoZ/daNAwtAMHHo5jr7WqRKuRNamoN1V/W1tfFn01Ws/vbzOqXK4/dEPN80HJqYbmqZT+2th949zOZDNIOpCJrqyXkT0G5TOtQaoN43C+MJ3t0=
Received: from SA0PR12MB4413.namprd12.prod.outlook.com (2603:10b6:806:9e::9)
 by CYYPR12MB8922.namprd12.prod.outlook.com (2603:10b6:930:b8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 13:15:07 +0000
Received: from SA0PR12MB4413.namprd12.prod.outlook.com
 ([fe80::12ba:707d:284:a4de]) by SA0PR12MB4413.namprd12.prod.outlook.com
 ([fe80::12ba:707d:284:a4de%7]) with mapi id 15.20.7091.022; Tue, 12 Dec 2023
 13:15:06 +0000
X-SNPS-Relay: synopsys.com
From: Jiangfeng Ma <Jiangfeng.Ma@synopsys.com>
To: Serge Semin <fancer.lancer@gmail.com>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>
Thread-Topic: [PATCH] net:stmmac:stmmac_platform:Add snps,xpcs devicetree
 parsing
Thread-Index: AdopoV2G4U4p6KhERnimGhWz15HefgADSasAAA0RnAAAt6TJAAAOlyww
Date: Tue, 12 Dec 2023 13:15:06 +0000
Message-ID: <SA0PR12MB4413B8B6EDF08A1075E0B5AFD98EA@SA0PR12MB4413.namprd12.prod.outlook.com>
References: <SA0PR12MB44138E48A245378CF54D2F9ED98AA@SA0PR12MB4413.namprd12.prod.outlook.com>
 <20231208091408.071680db@device.home>
 <uzss3af2cklc5bx5apszoegafeaaiv7o7iwgrgrml4grkyev6p@6tme4hdb4mkn>
 <SA0PR12MB4413305305D47CAAAFEAD528D98EA@SA0PR12MB4413.namprd12.prod.outlook.com>
In-Reply-To: <SA0PR12MB4413305305D47CAAAFEAD528D98EA@SA0PR12MB4413.namprd12.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcamlhbWFcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy03NTIzNmEyYi05OGYwLTExZWUtYmFhMy1jYzk2ZTU2NGY4OGJcYW1lLXRlc3RcNzUyMzZhMmQtOThmMC0xMWVlLWJhYTMtY2M5NmU1NjRmODhiYm9keS50eHQiIHN6PSIxMjY3MiIgdD0iMTMzNDY4NjA1MDMwMTk4NzU4IiBoPSJRMHFWMnBkdWFTRzlScUo3TDloVzBYZDVWUFE9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA0PR12MB4413:EE_|CYYPR12MB8922:EE_
x-ms-office365-filtering-correlation-id: 121cccf4-26e4-42d3-0902-08dbfb145bf4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pSTzIOdBv3T/+sLzm4Fd8NkGSAJ88O2q2fP1hxLQUt8t3qnNrdWVPNmcV+FKwXLg8HDCsPK7Sy+Hix/6QbEEYiAT+ukzeAS5qUaVAhdOFqbHctgYqIz0VqH19uBbIV4VglSP2ws76uxUz97vNdNlzpOR5xOBe/5LerIbPQzdS1WBRiZ99I3gDpc+mPsuOxIDI351R0Hqqx0GpzShswo5DPgBRpFhhnla3o0yshgzmdQucPfPJS5B0q332BU6YWU6P2vg8PRuGL3PY3GIdWCdNzNrp5txsOpVqmbOiRzijVZ3U3ynAKZWIw1NSJa58g82cKSF9rFe2b0kzyjbc80BbdnhN7GBDFdjTcrWfw6z7eJEHX8+2NWRB3moVkFAGtFCPjKO7hjoVtUt1C7EPC+PTM3gaDAVSS2gjQzxk7MF7gJJWPNvby1zO0zl038OzMGDKmaxm5xSSK8+pmjHo72khRPnJwpapT71ZRrN2Ool/t5HeS+pDI7efPxTybFch226SWKgc9YzQbmGQgR8qDxXysmWsOLSq1dmo/aOErVUsDn2FLmIgKDTjPx6yWNb1BjeQM95+gNOE3c1OTIAyfc+FjnRZnhGgOJUXbA8RPeUZUA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4413.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(396003)(39860400002)(366004)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(52536014)(5660300002)(55016003)(4326008)(8676002)(8936002)(7416002)(2906002)(316002)(66476007)(66446008)(76116006)(54906003)(64756008)(66556008)(110136005)(66946007)(53546011)(19627235002)(966005)(107886003)(41300700001)(9686003)(478600001)(2940100002)(71200400001)(26005)(83380400001)(33656002)(6506007)(38100700002)(38070700009)(86362001)(7696005)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SWErZWo4WkYvRHE3KzlYbTdjQmtyQ0JPWjBkcitZNERFUHJoT3FFQnVYY0FD?=
 =?utf-8?B?RFFhVVd6eURqWTJ6SS9EMFFtMGNvY3orUzV2cGVlS1htUnlXaXpkamNLeUlp?=
 =?utf-8?B?RnhIM2ZJZm1tMG9DZUNBbkVrclVNVWdieU1wZ25FM3JLMmVCc3ZESWFNUE02?=
 =?utf-8?B?NVYvSXpXU0U4SmZNb3ZTNlArVUEzS1hxK2o3eDVmSGZwd1kvSXZReFZad21v?=
 =?utf-8?B?RWQ4ajBmYjFqcTFQZ1k2dHQyREtJMVpCL3lCUHZMM3hlN284QjlzOTUvN1Yy?=
 =?utf-8?B?VHNnU2prNDNLenFXeGtTZWZFbjN0NEo0MlNmc01wcXMvWW9pdnl1eG4wVTM2?=
 =?utf-8?B?Sm1RSnpGTE16aTdoUkU5Ukc5Y3c1UGJWYnFWa0dCVzd0TzArK3lqQmx1NjVy?=
 =?utf-8?B?RXUveUpCdTIrazVNMldYejhZclQ0VHVnamNDNkhBOEdlbVMxQnRPSTF3Wk04?=
 =?utf-8?B?NDZuakRjRDd6MFJ5WTZTNU9VMlE5ZWxJd2NzM1hnczVYdEJFMVZCcFpxaGpQ?=
 =?utf-8?B?STN5elZlNDZRZWVBeFJ3R3BKTEFnTk5hWXU0VEh0cFhsUXIwM0p6YzArWkhD?=
 =?utf-8?B?a2JDeGFoblkyb2xMOTNOdWFjeUlOU2R6WklVWk80OWNhUFdaclJGc3lwbnMx?=
 =?utf-8?B?Z05JODRhUGFXK3l5ZXNkN1owQlBZTURQWU1sU09JdkM3RFhseC83STlJTmxt?=
 =?utf-8?B?ZFArRnFxZE1vQnM3Nm0zU2RmdWVGemJSQVh2d0hNVlVZa3FPajRHcVRPSS9a?=
 =?utf-8?B?WTdhd2dyVndscE05bWY5K0RLSFRmeUp5dU1TWmtsS0Y0eGRMUEFWMnNTK3Rp?=
 =?utf-8?B?U2lOOVQ2b0M3czN0SlBWVzB4TGhKVlh1RjA3N3FFZzVsbXNKOUFKTHU4MVJX?=
 =?utf-8?B?UUYrTTVlVzZRN0V3RzY5RFlBU3dVMm9KVFB0NzQveHlTSThwemZvNXQ3OVJZ?=
 =?utf-8?B?bnVzbENxSUpUYi9ZUitQQ3crUXM4THRiMXFWbVpFc3d0Y2htdksrS2hhaXAz?=
 =?utf-8?B?bFZIdnlhREV1allwRXE5V211Q1pIY3p5VWJQajVrajhlRTMvdTBjQlJQVVN4?=
 =?utf-8?B?WWFRbXZhcDZqRkJmclhVWU0wSDNURjlUeWRBSE5aMDU5WTJpdmJsQ2sySDJM?=
 =?utf-8?B?MlhPMGlyYkE2cUE5T2g5cjhkellZMUpCQ09MWitRdXZaK1ZMbXJzbkRUdGd4?=
 =?utf-8?B?U2Z5aHFkRU5uMk5ieVpFYzRJUnltVE00UEZ6Nk45dDRIbWx3NDQ0ODlIV2RF?=
 =?utf-8?B?cHBNc01DaVBESVYxRTNQVzdQRlh3TFN4cDdUUU1YL1NpS0RIQnk2cExYMURS?=
 =?utf-8?B?NkhzUnB4UWdFclJWN3pIcVFWdTJLMkY0S053UE5zK1pBd1FZZ01Vd21kdkUy?=
 =?utf-8?B?K05oMjh6YmhBZk9YMXBRWkNpdHdYYzYrR3lZTm9kVExWSE1OMXBKTUlRL0Ji?=
 =?utf-8?B?S1JHcnJSZGxLNXE5Y0RqcFdTTjhadE5NSmN6azhaOGg1WFBiUHlrcWJyemdM?=
 =?utf-8?B?aVZndGpIZ2RTQnpKTlNkZTdvSmNZbC8xODNyTnpHNHJOaEF5MnhDSUZUYVlV?=
 =?utf-8?B?NlhiNC9sbEdWTEhKVFY2eVRBdVdVRjc4dTg4cFdwU0lhRVd3UGs2SER3eHhX?=
 =?utf-8?B?UWRrL3RZcjVqSFVjalFlU3hwUlZncnk1eVk3M055V2M2ckY5ZzFCdCtyRXhi?=
 =?utf-8?B?SUJVOUQ4bkV1MDgwU3daY2xTOFZGY1QxVklSd3BwZWUveXVCcVRTQjRUUVk0?=
 =?utf-8?B?b29nYVdXaDgwamhnVmNVWjJpUFVWSGc2NGtPcmQvbFVsZ2QvRGs0QXV0d1dj?=
 =?utf-8?B?SXM0NlNvWmYra1U5VWRuTnZ0OFEzZXRDOFZXTklNaDYzc3FrY1hmeDlNNysr?=
 =?utf-8?B?d0VVVVpRSGtkbFNSY2RNWWh1bTJ6OXhialcvZVQzQ1FMcENHNytpZ1Jva2Y3?=
 =?utf-8?B?R3dyY3J5and6WjFyVVVQaTY4eUp3YTBySXVrbFZFYlNZV1hKQ0lJcVVoQ0lS?=
 =?utf-8?B?bjQ1VnVlOWNIVUQzK2lZRWZzcDU3ZkhOM0llVGMwK0lYRXgwd2pGN1JzQVlB?=
 =?utf-8?B?YUhTQmpQdlZ0N29odU5RbVNOekpOVmt4ektpM1BrRTFCSW5EMjYzNHE1UGJ2?=
 =?utf-8?Q?dv90=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?Vm1JOEZSTHRMMXYxU0JKVkFINEE4Vzk4SGRoV0hxRGlGd0l0NXM5MWxTOHBa?=
 =?utf-8?B?a2YyQWIvMW1QdmtTU3lXY2dEMzgrd1RXUTY2RU5xd1hQSCt1M3BoMUoxby9i?=
 =?utf-8?B?ZTMvSmg3bWMvNEhrOVdDSjA1bVVyME5BRVlZYU9GUmNaOTFsSWRGSkQ5SmZj?=
 =?utf-8?B?UkJ5KzFGQnpNMVdVQkJhalIxRlZ6YzFTcEJCTFRjMmcramRmeUcrdVYxOW0v?=
 =?utf-8?B?d1UrV0MvdlhTTWt4R3laOEllZTR2OVk5ZVlhV2JkMjlJN0JZdW44K0ZUNUcr?=
 =?utf-8?B?WFNlK2twdjFmcjdhMVBla2pCNUZTODNxQ1dnWEZUM2xNbzdmeks3VEgwTVBj?=
 =?utf-8?B?eWYyakJDcU5yOGI1Q1dMbUFXTmpXNmRwUzFkQ3RTUEl6Z2Q2ZlcxTVkzV3Zk?=
 =?utf-8?B?dVFaSDdZaFRjWjdmQzQwVXppU05jTVFyclVhQkJyMHZEV0plUkdzVzVZVCty?=
 =?utf-8?B?aXdEY0NqNXZWT0VMQ2tBdzJHSDJKNzJiZVE2SDRtZk5tdEVKN04vZFlQZ0Zy?=
 =?utf-8?B?STQwNlNNQXpnamhlQmljdXZzQ0xCT2xGd09WcUtHM0Z5eFJveC80NTl1THRk?=
 =?utf-8?B?d2FYRHlTRnVCNFVDeFk2UnlxcmNna1RBdnBkYXpKT21ndDdtaG12ZXlFdnBu?=
 =?utf-8?B?UEQ2SWRGNUplMTlxT3VocHRWdUZQSGQxVTdDd3JVR1M4ZHU3R3Y4dzd1T0VG?=
 =?utf-8?B?bjhETTJFcUJ2My9Oc09Ddjlsc0kzQ2RGUXZzaUNmNThRa1VIOStlS2w2ZkpO?=
 =?utf-8?B?UzhFcEVDamhLK2toRVFJZXJFRmVCR1JHVlMrTU1JL2xPU1lUZ0NvMEFLOHpZ?=
 =?utf-8?B?ZmtnM1o4anp5YUcxUWljMm1mN3J1OGRqeWJsMTRZMHVEb3Fva1Vvem91Sys3?=
 =?utf-8?B?K29iY0MySWZick53clpndTRYWWJlSHR4eEMwdkpCSHVSYzVyK1BCdFF0cnZM?=
 =?utf-8?B?TTNjTWxLY1YybExNdnlxbXFnbk5xcHZmTzI5T2Q3YTZRdmZEUndhcTJ1ZzJj?=
 =?utf-8?B?Y25VU2Uxd1g2aEVvQmw4RnRiSk1Sd010NHBvMmpZbHpyVmpNeUVBOWV2WnFl?=
 =?utf-8?B?bmp4amVob2E3bWU4elhzVmVSNGcxR1orRjRMbForcjdiNFVOdW5yTDFkRHNW?=
 =?utf-8?B?OWZCZ0V3NEIwL2dveFdkNG42VUNCU1NjNVhweXkxMjFGc2dHSE9nTTdiSzdV?=
 =?utf-8?B?ajVPcFVWblBoRmJuMFdBRlA1bG5qY0FTNkMvT213MCt3dEhIRmRLdWVkalBh?=
 =?utf-8?B?L3pSL3RXZmwvYk5NUTJWRGlZcE93R1hJallrc3pVbmlGekJJamNQU3V3M0Rt?=
 =?utf-8?B?WjZjaFZURjJtUVBTMGZrNXJQc0VsdzJkZWZUNUhoWmxTZzRKT0JKK3p2ZG5S?=
 =?utf-8?B?bkM5K3o3bDdJZndaUVFqcXJnc0tjeCtpMGY0YlVKSy8vOWsxWngxa1FPOURL?=
 =?utf-8?B?bXUreVlibzFBS2NWOGo4dk9MYkNZSFNwZmZ2U2NnaEJSYWVzWkVpZEVhZktD?=
 =?utf-8?B?Ny9BL3pXaXRweE1PVWx1czZ5akJwditZaHMyYWtQVlVwUUN5clpYT2JPUUN4?=
 =?utf-8?B?aEtWVUJONzlhN25tOFh2djJUdFZUdGR3QjdVZ3czZUtTS1FhUm1RYlFaSnR0?=
 =?utf-8?B?Nkh6a2dLNE1ETGNRYnJUMDNqN3lJSDNjOG43UzE0VXVLU0ViZFpiZzhraHpj?=
 =?utf-8?B?ZWEvNG5jczFvb3dQMnM4aGxjSElRWW9LUTIxQWM5SjY4K202MktoUGw4aVFN?=
 =?utf-8?B?YlIyb0NPT3BEbWIxc0lVKzhIdURFdVhJRWh6RStWQ3Y5OU0wc1Bud3FFcmds?=
 =?utf-8?Q?Y6wUZ1DKrOWyHEnGONkm3tb072txjF4b1icjg=3D?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 121cccf4-26e4-42d3-0902-08dbfb145bf4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2023 13:15:06.3207 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a1QpnAno4+1/h7T3h/18MYaQv90wl1CK5nUXmTtZmm9nuIlwmRALLLxUHXGgbGAutuKndLkzcyCFHyvbF1ZA5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8922
X-Proofpoint-GUID: Q__JiI6pMgAqccmrU7Sk8YQfxAeVuXYq
X-Proofpoint-ORIG-GUID: Q__JiI6pMgAqccmrU7Sk8YQfxAeVuXYq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0 bulkscore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312120103
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Johannes Zink <j.zink@pengutronix.de>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Simon Horman <horms@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
 James Li <James.Li1@synopsys.com>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Shenwei Wang <shenwei.wang@nxp.com>,
 Martin McKenny <Martin.McKenny@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 "Russell King  \(Oracle" <rmk+kernel@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH] net:stmmac:stmmac_platform:Add snps,
 xpcs devicetree parsing
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



> -----Original Message-----
> From: Jiangfeng Ma
> Sent: Tuesday, December 12, 2023 6:51 PM
> To: Serge Semin <fancer.lancer@gmail.com>; Maxime Chevallier <maxime.chevallier@bootlin.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>; Jose Abreu <joabreu@synopsys.com>; David
> S. Miller <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>; Jakub Kicinski
> <kuba@kernel.org>; Paolo Abeni <pabeni@redhat.com>; Maxime Coquelin
> <mcoquelin.stm32@gmail.com>; Simon Horman <horms@kernel.org>; Andrew Halaney
> <ahalaney@redhat.com>; Bartosz Golaszewski <bartosz.golaszewski@linaro.org>; Shenwei Wang
> <shenwei.wang@nxp.com>; Johannes Zink <j.zink@pengutronix.de>; Russell King (Oracle
> <rmk+kernel@armlinux.org.uk>; Jochen Henneberg <jh@henneberg-systemdesign.com>; open
> list:STMMAC ETHERNET DRIVER <netdev@vger.kernel.org>; moderated list:ARM/STM32
> ARCHITECTURE <linux-stm32@st-md-mailman.stormreply.com>; moderated list:ARM/STM32
> ARCHITECTURE <linux-arm-kernel@lists.infradead.org>; open list <linux-kernel@vger.kernel.org>;
> James Li <lijames@synopsys.com>; Martin McKenny <mmckenny@synopsys.com>
> Subject: Re: [PATCH] net:stmmac:stmmac_platform:Add snps,xpcs devicetree parsing
> 
Sorry for the problem with my mail settings.
> 
> > -----Original Message-----
> > From: Serge Semin <fancer.lancer@gmail.com>
> > Sent: Friday, December 8, 2023 10:28 PM
> > To: Maxime Chevallier <maxime.chevallier@bootlin.com>; Jiangfeng Ma
> <jiama@synopsys.com>
> > Cc: Jiangfeng Ma <jiama@synopsys.com>; Alexandre Torgue <alexandre.torgue@foss.st.com>;
> Jose
> > Abreu <joabreu@synopsys.com>; David S. Miller <davem@davemloft.net>; Eric Dumazet
> > <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Paolo Abeni <pabeni@redhat.com>;
> > Maxime Coquelin <mcoquelin.stm32@gmail.com>; Simon Horman <horms@kernel.org>; Andrew
> > Halaney <ahalaney@redhat.com>; Bartosz Golaszewski <bartosz.golaszewski@linaro.org>; Shenwei
> > Wang <shenwei.wang@nxp.com>; Johannes Zink <j.zink@pengutronix.de>; Russell King (Oracle
> > <rmk+kernel@armlinux.org.uk>; Jochen Henneberg <jh@henneberg-systemdesign.com>; open
> > list:STMMAC ETHERNET DRIVER <netdev@vger.kernel.org>; moderated list:ARM/STM32
> > ARCHITECTURE <linux-stm32@st-md-mailman.stormreply.com>; moderated list:ARM/STM32
> > ARCHITECTURE <linux-arm-kernel@lists.infradead.org>; open list <linux-kernel@vger.kernel.org>;
> James
> > Li <lijames@synopsys.com>; Martin McKenny <mmckenny@synopsys.com>
> > Subject:  Re: [PATCH] net:stmmac:stmmac_platform:Add snps,xpcs devicetree parsing
> >
> Hi Maxime, Serge
> Thanks for your review!
> 
> > Hi Maxime, Jiangfeng
> >
> > On Fri, Dec 08, 2023 at 09:14:08AM +0100, Maxime Chevallier wrote:
> > > Hello,
> > >
> > > On Fri, 8 Dec 2023 07:02:19 +0000
> > > Jiangfeng Ma <Jiangfeng.Ma@synopsys.com> wrote:
> > >
> > > > In order to setup xpcs, has_xpcs must be set to a non-zero value.
> > > > Add new optional devicetree properties representing this.
> > > >
> > > > If has_xpcs is set to true, then xpcs_an_inband should preferably be
> > > > consistent with it, Otherwise, some errors may occur when starting
> > > > the network, For example, the phy interface that xpcs already supports,
> > > > but link up fails.
> > >
> > > Can you elaborate on why you need this, and on which platform
> > > especially ? Usually drivers for the various stmmac variants know if
> > > they have XPCS or not, or can guess it based on some info such as the
> > > configured PHY mode (dwmac-intel).
> 
> There is no specific platform here. I utilize the dwmcac-generic platform,
> and xpcs is utilized as the MDIO device or it can be seen as a C45 PHY.
> While it's sometimes possible to deduce the presence of xpcs based on information
> such as the phy mode (dwmac-intel), this is not always a definitive indicator.
> For instance, the support of SGMII by XPCS doesn't imply
> that all SGMII-supporting PHYs include XPCS. But as Serge mentioned, using pcs-handle,
> or pcs-handle-name might be a more effective approach.
> > >
> > > Besides that, there are a few issues with your submission. If DT is the
> > > way to go (and I don't say it is), you would also need to update the
> > > bindings to document that property.
> > >
> > > > The types of has_xpcs and xpcs_an_inband are unsigned int,
> > > > and generally used as flags. So it may be more reasonable to set them to
> > > > bool type. This can also be confirmed from the type of @ovr_an_inband.
> > >
> > > And this part would go into a separate patch.
> Sorry for this issue, I will create the patch separately later.
> >
> > In addition to what Maxime already said having DT-bindings adjusted to
> > fit to the pattern implemented in the software part is a wrong way to
> > go. The best choice in this case is to add the DW XPCS DT-node to the
> > DW MAC MDIO/MI bus and then use the "pcs-handle" to inform the MAC
> > (mainly it's driver) of what PCS-device is actually attached to it.
> > The series I submitted on this week is exactly about that:
> > https://urldefense.com/v3/__https://lore.kernel.org/netdev/20231205103559.9605-1-
> fancer.lancer@g
> > mail.com/__;!!A4F2R9G_pg!Y6R3WZWHeBdrkZklbqrAQARbHnQ-
> g_Tbb6r5IqcsSHMQ_l4rOzLLgZvLPl6YP
> > BYferbjrbjZA6_XvSSSvkV35eo2jWPz$
> > I guess I'll need about a month or so to settle all the comments, but
> > the solution implemented there will be better than this one really.
> >
> Yes, I agree that binding the xpcs via the "pcs-handle" DT firmware node
> is a better way. but the current method of binding xpcs through scanning
> addresses still relies on mdio_bus_data->has_xpcs.
> The 16th patch in your patchset also mentions the difficulty of
> obtaining has_xpcs. Therefore, can we add parsing of pcs-handle-names
> in the platform to determine if the xpcs exists, like this:
> 
> if (plat->mdio_bus_data) {
> 	rc = of_property_match_string(np, "pcs-handle-names", "dw-xpcs");
> 	if (rc >= 0) {
> 		plat->mdio_bus_data->has_xpcs = true;
> 		plat->mdio_bus_data->xpcs_an_inband = true;
> 	}
> }
> 
> Thanks,
> Jiangfeng
> 
> > -Serge(y)
> >
> > >
> > > Thanks,
> > >
> > > Maxime
> > >
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

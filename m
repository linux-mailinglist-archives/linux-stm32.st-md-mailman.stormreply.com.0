Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 995BDA284F5
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Feb 2025 08:29:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4161FC78F89;
	Wed,  5 Feb 2025 07:29:54 +0000 (UTC)
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com
 [148.163.156.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10A8FC78F88
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Feb 2025 07:29:46 +0000 (UTC)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
 by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5156hkMb006655;
 Tue, 4 Feb 2025 23:29:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
 cc:content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 pfptdkimsnps; bh=WdKzH0nkIWu5wXGCpB819wmONSzpBwK1HN37MLJaT5A=; b=
 GNfSNzuSE2+6OBMjBJpp//bIJ6coYaY9TE9nMJYb+80+vmmPHjdqdxRIchVVvwSy
 j8WP4EgC+1z5DeNtGt26Dr7uCiksyuKT4U7EeBX0hGbYwIMlaPnqgjrmmPaHxv5b
 NTVAiIlP4Dq2Wc/4kvTp309nyIGvb6OQ1r6v5VFtFZV1/WOcBBwWdrh2zWeZJaJc
 2jkdhGs4tCZhxTv6bjqgi0KyFk8jFQ/RMEcuLu2Bff5aaX47jzLy7c0NDutH6P25
 E9JWgJ4RCTXpYVznHEjh4Tzrbt8lBdruT3cPyJ1xpSgd8I2E3QuWjR2zkhd7NcMN
 6UQ8QcAKFnTAwmA1I91wpw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 44ku6ua3xc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Feb 2025 23:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1738740580; bh=WdKzH0nkIWu5wXGCpB819wmONSzpBwK1HN37MLJaT5A=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=KK4qoxHkpxnU7zMSky3tCip2VDmVn/60c/WqsQAbsX7sZFPVy+B1/TthOMQvnfZc6
 UI1ZaVH5Hv5weRrHrDUBr9C/qqNEr5MGAvhzlTHrTrWqRUuDJ7xCJI7JDJsBhTpnLX
 JGYDv8unGamf3VIT5VPl03wSq7mSUu5o5Kmq2Oh7n+Ssofc53xgZZrtmfVkQxkQQIa
 bVQOi4qQ8Vq2up2t06SQlvGPfVaucB8w4dxg8+syf5up6cWZ7ML8uW8evXn+hGS9VR
 2tSJ0SfN0Ekf4f4pRln1p4hpQV3nmF67DXhce40meMu8yRf4y/HnHWAsSXP1Hs4yMO
 ISx+ePKA73Ayg==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits)
 client-signature RSA-PSS (2048 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D29C040354;
 Wed,  5 Feb 2025 07:29:39 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (not verified))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 178B1A008E;
 Wed,  5 Feb 2025 07:29:39 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=bh8plREw; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id F31BB408F2;
 Wed,  5 Feb 2025 07:29:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gVVVQxPqlY7JZon//BzNp3rs/VMpyBgehnWaPHQFiEc6T76TD4T247rH10cRUP00JNmIahhHQOVTND2T4TeOkuv0zfImtKoPGDTyPQnbqc4g3m8qXfCiUxxZ4+X8g+NRAnWVcT1kt8GaWMrM18tvVdkFLsY4cMMKbIOkP2JpywrMNSY4UaZLwZo+QrwErlgxxw/6rcU+fFZf63uFVdBjRaChUCt4j7/Fo9gcBQCTwDu/cWJLtTMUln2TO8kI+E37MqO/qczXS4BkFrfQCtOXnJBA0rBh9xmLOiuLLB7WgLoI/vnTA6tQhb+WRwRU+u+rzKs3IE8J9ezMzXtX3iOcdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdKzH0nkIWu5wXGCpB819wmONSzpBwK1HN37MLJaT5A=;
 b=haL+0SeJ3dharUubjq4hiS+WDen1lMqD34ou2fbT0sefCGt8GCyhasr1F+sqVnEW5nmc+WV9chWcJg8dJpkrKnFAmMtVBoKZJCRANAnj/wlRR8hVtJl1IgpSDs92fmoxtonz7cHQRWrrBZwZmUR/cQHSyf98CIOIrgtoORweYUwWtm4Wq8yPbgVJnX0No/zRwq0YDWE8zHTSDVC0gVtKh3E7dpYNJyxDf/PNAHiQVojULX0J4Nz9vo1rUvk9YagsPbNtap6TrNAXtBNX7X9P4oVYqBe8RdESLvr6Hg1uM1gvpS6yTxsf08IfgKudNLCSGRAcucnXmDRxExhYZsfObw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WdKzH0nkIWu5wXGCpB819wmONSzpBwK1HN37MLJaT5A=;
 b=bh8plREwYP5J8UkPrGtvPnTur/xfv1cMIUE0yBWYQ/c0H2dmDaDTmOAwztFtZe03Kdk6keJXuRx+d2qkXhyrJl7+sTxSOkfhn5dC+wa5tyc91QmyfBVAd5frV1kbnObIUfRUk1fd8ZArcevPV1g90DDY5kebMR4zySSzTAf8el4=
Received: from DS0PR12MB8785.namprd12.prod.outlook.com (2603:10b6:8:14c::18)
 by MN2PR12MB4222.namprd12.prod.outlook.com (2603:10b6:208:19a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Wed, 5 Feb
 2025 07:29:35 +0000
Received: from DS0PR12MB8785.namprd12.prod.outlook.com
 ([fe80::e65e:862a:6373:68f0]) by DS0PR12MB8785.namprd12.prod.outlook.com
 ([fe80::e65e:862a:6373:68f0%4]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 07:29:35 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Thread-Topic: [PATCH] usb: dwc2: gadget: remove of_node reference upon udc_stop
Thread-Index: AQHbboZMESyQ5ibVQEqrnYKjJpJ7XLM4YlsA
Date: Wed, 5 Feb 2025 07:29:35 +0000
Message-ID: <91225fb4-1184-cb4c-1716-f067a407a37f@synopsys.com>
References: <20250124173325.2747710-1-fabrice.gasnier@foss.st.com>
In-Reply-To: <20250124173325.2747710-1-fabrice.gasnier@foss.st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR12MB8785:EE_|MN2PR12MB4222:EE_
x-ms-office365-filtering-correlation-id: a84ba540-fbbb-4343-7ae3-08dd45b6d719
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TlBBMkNid05pcGRvM0dLRmk3N2M4Nmg5ZUV2S0libUtuRlQwZzdxeC82S3VE?=
 =?utf-8?B?WjVPbjByWTloYWpKQ1E5OHBtc3VZbVFxRUtnZTBQQlJMYWpxTHdlQ0FGQ0pu?=
 =?utf-8?B?VjhHT21VdFl4YVNoWUdScDFKd1AzeVdEVGcxWW5WVmtmdXlJZDdjdUQ2Z08w?=
 =?utf-8?B?MUgreFVmazBoVVBQMmc3TWliV3UxVFFWNzNzSi9RZEhlS2hrelA3T1JJNG5H?=
 =?utf-8?B?WU8ySkNjeU5BdEhwZHY1WnFPSUxkU3AwMWxWbnFaSGQ1OUV6NlFGNEpvd1ZC?=
 =?utf-8?B?M2g1Uy9rbHZXUFZUaUJJbGoxZ0hidTUwTlJacE9nNXJNOW5DT3BlalRWSkZi?=
 =?utf-8?B?WE9rb0VWUVRNcExPbERrS3duWmxxdUZ5NmI3TXdGRTNRcndVZVBHamRWRDU3?=
 =?utf-8?B?TDRsNldiMnMxVlAzYjh2MklEQlE5eXZtNStvU1BkYVE2eGNqemtkdEYwb2gv?=
 =?utf-8?B?bENQM2s0NnVJL0ViTFM5UUQrUDI1dVBnRUl1eGM2Vm1TSDVwY21oSXNDczl6?=
 =?utf-8?B?bUVNemdGTW9SK0NRT1VsWVMyQy9SSkJxcWgvb1VGbUpKZlpXbFExVG9UNTRo?=
 =?utf-8?B?VSt2Y3kxbVVtWVdDc0NsaENJdGZIbkVOMmtRd3dFTFdFaDcyZnIrSDBWOHRK?=
 =?utf-8?B?cXdUN2JGc2ZBR3ZtaC9lMEpQdzFnRGhKMkhHRTlaT1BWNXVFUWg2T1B2TUhP?=
 =?utf-8?B?blVIRVpnUXZtMFFVaWpQTWtMZFJHSko2WkxkZkpLdnd0R0tna2prenhFT015?=
 =?utf-8?B?dGFGQTNmZEVRcjJHdFBQdDBwMG96bW91YnZjTWNCc01UU1dibERGaURHNXRU?=
 =?utf-8?B?VVAyR3ppY1dUZm1aRFlIeldwbmN6azV1Z0FPMU5oYmVhRGxmRE1XdGlxQUFC?=
 =?utf-8?B?MElOWDZtalJ4aDc1QTdJTlY3Z055eW80Ny9mbkFJWW1lU3krTWpyOGNsVk1p?=
 =?utf-8?B?YzdUaWJ1cENKQmE5enMrd1BGcDgyaUE3TTJxWFdlNk9FY1hPeGJzMVdKUG8v?=
 =?utf-8?B?SCtlMUxxNkZ2Wnl3bjNpYSthNkpxSGhOTVlwWUNoZ2tlQ01WUVBLbXVJUmFn?=
 =?utf-8?B?eHJQK25ZbHl5bXlEamtGVDA4SmVWRlpnOFZiQzVVNDZQYk9zT2hjNkNxZmZT?=
 =?utf-8?B?WDJiZDk1ZzFkRmhNZWh3blppNU1kUWRHaHpGcHl5N2hZeXc3cTBxSDZ5VThF?=
 =?utf-8?B?UEZwM0NsMCtnbWk4WlYzV1g1dURtNXp5bXprdlh3WUFCd3pHQWVSN3Zhb2Jn?=
 =?utf-8?B?UXlUV3BBY1hUMDY0ZFlyN0h5YTJDVjVOVkg2VnFvOCtpYXRKS2t2dGhEUk83?=
 =?utf-8?B?Wk12MEc1N2lnRGhtbFNVRTNXd0h3R0lWbURGTnhEOFQvNXY1OU0xTWdaV1pJ?=
 =?utf-8?B?WVgrR1k1VXNWSFJqYkhJSkZ4eHhSR0J2V2JvRTNnVThWUVVLNkNGTkZLSWVF?=
 =?utf-8?B?SHhKNis2TVgxUmRYYW0zUEJ6c0xhUkpKWHAxSFJyNE16MFJkTXN5LzYyUDhw?=
 =?utf-8?B?R0ZPRURBRCtyZ0VYeUVaS0V4OWpRSmgvaVJlTVFyTUZiaEVWdDdBc2cwZ29I?=
 =?utf-8?B?VTBrZFBYSlBGWlRwUXRyUEZPOVlqSExrWlpFYzNCRkIyS05hTjN6QzlpSDZl?=
 =?utf-8?B?aUpHWkUvdDV5SkNDck9oUm1RMWYwczYyWUszU3ZrWEJNL0RQamR1cVo4VklN?=
 =?utf-8?B?TkZZdFN5Z00zR21Rc0pkV0tudVAya3cwTEkzeTJnRVc1MS9McWwwakpZYlBK?=
 =?utf-8?B?UENLZXJrTUFTL3U2S2JGL3NKSGhodjNwWUsvdXRRREV5SWJOUFBMcFdBdzEv?=
 =?utf-8?B?a3dFdDZLV0xBUW1NMXZBb0w4KzVESldhMmdmOGpMRXBNTnpnc3p1bTJxbVNR?=
 =?utf-8?B?TWhMOHFtdTV3M0Y5bmdqYVk4a3R6WkEybDUzVTM2QXZ5WDNtLzJwZVVWL2VI?=
 =?utf-8?Q?7YH9eRkmCg/YGqqt6mSH4Li0hf9u5hEp?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB8785.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c09ZVjAwRHhnaXd2bnRCREtPQ0FrUFhZVm1LVjMvZUpCd0VCZmJBMDc3b0di?=
 =?utf-8?B?WlJNT3c5Y0UrRE5Kdk5YenJOeEZ1WUJJRXE0eGJOWElsQVFXM25CTUlOOXVF?=
 =?utf-8?B?eGhjZDFRbGFSMUd1YmxWSVhOcXh0TkZRUjY1K05zTVJvekp0Tk92cmMyNWcx?=
 =?utf-8?B?QzZ4OVlzS3Fxc3RXZ0plemg4TXM5WDFrQUtNY3JKVTMvZnovQ3BKNXZBSCt6?=
 =?utf-8?B?dEYvbCsrL0Y4U1NmbXZ5a1dKOThURHppOTV5YUdvMmNkVWgwUGEvQjBZeVhs?=
 =?utf-8?B?cTg3UmlsbSthRmpXR3hHaXNPaEZXVGpGb0ZlajMxZHN6V0xkUVpVMGtZV1o2?=
 =?utf-8?B?ck5xWWRXM2FNMEN0Q0REMStLeklLeWt1MEo1ckE1WElrS292aUNHVTZqc2FE?=
 =?utf-8?B?VmRRSDg2WitzZWpPTjlLQmlSTXFTeG4zZzhRV1lTdHp3TWJOMzFQYmd4ckZl?=
 =?utf-8?B?cW9sYzdnT0hLaE5UdWdSblhzbmtJSUx3amZQVGJzaWJVL0UxeHJIOWdiR0pn?=
 =?utf-8?B?R0xGaWZBTlBnc3F1UEcyeks1RStKTEM2SzFyYXBqdnpIcTRHZlV3SkJQckJm?=
 =?utf-8?B?RUR2aWxBdE00R05BZlFxMUptR3JhNFRqc3VnaXJnTlJkYThrMEorOFdVN05U?=
 =?utf-8?B?dDNiY001UkJSYVJESDdiUFhjSmd0aUJyaDBzNlhWaWg4L2xzS0RVbVgyeUM0?=
 =?utf-8?B?VFlxdjV4RmZMRmdEVlNNbWZjQUN5SHNic0VXL1c2ZTBHazVGVVB6bVFrSDdU?=
 =?utf-8?B?NFhRNE1uRXJ6RFVKeitCUGZ2WURjYmw5aVdMZHlQT3VrUU9SMk16NkFjMUZq?=
 =?utf-8?B?ODJiT3NOZkk3ZVFKQ1lXbWZTMW0yZExtVldlZU5lcnN6cGNnSE1Eb010NlFO?=
 =?utf-8?B?ZVBlTnFlM1NJTzRRaEpuRlJrUFZ0TEVHOXJ0M2paUjZMOVd2Q0Vwa0ZIc3VB?=
 =?utf-8?B?bDhTMFZaNzBwS25mOHZ4WlZ4UnZkUG9QbzYyM3draWNIYkd1Zno5Z3Y2ZWJB?=
 =?utf-8?B?UXRhYWs4ejE5TU5ndlVFN243QmRRTHllM3A5VkJlQmVXZGtudk9XMUtva1pv?=
 =?utf-8?B?WjkvRFRCaEluZDc0Z2UwQzR5SHIzMVlyby82M2ZkRklpYTdGdFM5YTg1VjBC?=
 =?utf-8?B?Rmp1WEczY2VDOGFIc0lVNnhZZFF0aWY1bWhlVGljR1ZDWnhmeGR1d21pUlND?=
 =?utf-8?B?VENYcFZYc1lmbGtISXdIS2huZFR4WVIzYkNFT0E2MFJkYXUxVDdJenl2K2I1?=
 =?utf-8?B?anlTS1dWWEFGZWhtcGFrdkdCRFpGL0VNOTdxOW90RCsxVWJhUlB0c1F4WVUx?=
 =?utf-8?B?OE5NZVVMT0FiLzJsZmlpU0VaUVdla2IrVjV0NENwQzI0cXloV2NhNzZDbW1s?=
 =?utf-8?B?aUhoR1RrWG1tS2gyTm9URTMxR0tCWjlMVWdjYWhzYWQxRm9zR3JYbzR5S2dp?=
 =?utf-8?B?bWR2Um4ydnRnMVpmNWJmK3hEc00vVldjdUE2NURXbTRraVFFYk4ycjRmZUlH?=
 =?utf-8?B?dDZ0RWhBUXpvOU5KWTNFUUFieGhiMFlTN2g2RXZwUHRManNjWnk2R3ZzT3BI?=
 =?utf-8?B?TnB4VXNwejRPQXBNZnRvYkNKNjFmVWZFb1ZSYUJWYVpCc0NwbGczQUxEMk0y?=
 =?utf-8?B?VTVsTEtHQ0g0UU12SnlPd3hJVW00YTc4cWM5YlNKVGhGV3g2NmxnUTU4WGxO?=
 =?utf-8?B?TVRibHhhbWVHTGdkOGkrSHlpZGhrblo2bktYdEQwMjEzSTAxNklyQkNya2Fs?=
 =?utf-8?B?T1pBODJ6VVYwWXpXaGo0N082RFo4WmhVRHA1VWtxMmg4cWk4NlFQY1djZVh3?=
 =?utf-8?B?NDUyMGVSREtuYWNVQ2h3ZEpRYmpFRHVHV0ZlK01XTnhmNWQwbWZBRkdsUDFL?=
 =?utf-8?B?aFVQaWQ3NlhydlFIUnFBUHowZ2Voam9PMWdGbVU1YS9SakRJYXV0YkhMOWs3?=
 =?utf-8?B?Mkh5MXNHdXpZa3B6L1AyeUNCL2VUNnEybXk2ckpjbjdaWlBBZXpiRlh2VllU?=
 =?utf-8?B?c2dqU2dmWllKT1h4R01HV3VLWmxRRXE3VVNOZ0prVGJ5bVZhLzRDeGZzNHNI?=
 =?utf-8?B?bzgxT3VSRFJNRWg1eUswZjZPTE1raEs0b1hvOE10ZDZINWZvZk43cnhOYnJE?=
 =?utf-8?Q?q9DkeNw5O8f8L8ITuieqIWGzV?=
Content-ID: <550195A555A18145905BEEEBE5F17432@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: DI8/vyHEBwQfnLmyS2V91Y6iBQRYnnri80xrf1i05jMJf7Y3XIPqvKR3fpndECybqMfdnyb5jaa26EBux6jP4cxkqGNwkthbkJ1p5FpIEJCEXUGSD4B2FBQAI5s7Pf1Is4iAdA1l5XU9iSbIusoNVGrYZxx5daCBGgihzZhtzIgbIBHJqT7iXv88LN3wisyDMM0CekLGSI3nW/eLY33FtF+rVUMEwVL7BO4tr8FA27ez3jrwAJxblrEzPGfkObtVo+EUNw7MC9KUO2duQjrV5fnOM78Z4KOddloGwoTmVBaEueTErV/SlkbYRU3+e46mgJvIlkIMHzyylnXiWIOwiO+tkCc4Bco+IrtMtIj51lyuRW/IBuJPloVq7WYa0PkptIfXq7zekle9uBhz3/D7H5K9I5o++deFkqnhoZZe5m5wudmpEqpmejV1uPOEZsc2qwKH/oBGFAfZtuKr3d64FpoCwq+81MH+7AIV9jiRwh/FkPc/ACo+DXKgeUtVwpmUeCj5EqesvX0hcgrsw8WwEnrFJIvO1FGRUB0mpgbgRp0WZdSOMnx2wp6ETzc+U4UO3ENM/7V8Y8mQuPQ3+Se8WguUbsy9IV0UFXuMWMoJjI0Zd6L2yS2drtlI5ICUz90eJEgfyfJ79nUCU1eSK9dLrA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8785.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a84ba540-fbbb-4343-7ae3-08dd45b6d719
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2025 07:29:35.1552 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rvhnhalUX5k4SQeS39Uyd/rXDG3N8heFKgnxvPNfsyqs5HHMvm/9gx0oS8M+4j/DbSrnnAQIFQI9eY8XQI8UQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4222
X-Proofpoint-GUID: XO3rxITSCx_orMkljtrumAjy35X4sax1
X-Authority-Analysis: v=2.4 cv=HeDuTjE8 c=1 sm=1 tr=0 ts=67a31365 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=T2h4t0Lz3GQA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=8b9GpE9nAAAA:8 a=jIQo8A4GAAAA:8 a=GNu0EQzyMCytJNkwrDQA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-ORIG-GUID: XO3rxITSCx_orMkljtrumAjy35X4sax1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_03,2025-02-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 malwarescore=0 mlxlogscore=943 phishscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1011
 suspectscore=0 spamscore=0 impostorscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502050058
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH] usb: dwc2: gadget: remove of_node
	reference upon udc_stop
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



On 1/24/25 21:33, Fabrice Gasnier wrote:
> In dwc2_hsotg_udc_start(), e.g. when binding composite driver, "of_node"
> is set to hsotg->dev->of_node.
> 
> It causes errors when binding the gadget driver several times, on
> stm32mp157c-ev1 board. Below error is seen:
> "pin PA10 already requested by 49000000.usb-otg; cannot claim for gadget.0"
> 
> The first time, no issue is seen as when registering the driver, of_node
> isn't NULL:
> -> gadget_dev_desc_UDC_store
>    -> usb_gadget_register_driver_owner
>      -> driver_register
>      ...
>        -> really_probe -> pinctrl_bind_pins (no effect)
> 
> Then dwc2_hsotg_udc_start() sets of_node.
> 
> The second time (stop the gadget, reconfigure it, then start it again),
> of_node has been set, so the probing code tries to acquire pins for the
> gadget. These pins are hold by the controller, hence the error.
> 
> So clear gadget.dev.of_node in udc_stop() routine to avoid the issue.
> 
> Fixes: 7d7b22928b90 ("usb: gadget: s3c-hsotg: Propagate devicetree to gadget drivers")
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Acked-by: Minas Harutyunyan <hminas@synopsys.com>

> ---
> Note: I'd have been tempted to remove of_node setting from udc_start:
>   -	hsotg->gadget.dev.of_node = hsotg->dev->of_node;
> 
> I can't find the original code that parses the device node [1] from
> composite_bind() routine, originally part of the series that introduces
> this.
> I'm not sure if setting the gadget of_node is really useful, but I chose
> safe approach to simply clear it in udc_stop().
> 
> [1] https://urldefense.com/v3/__http://lore.kernel.org/lkml/1340720833-781-6-git-send-email-aletes.xgr@gmail.com/__;!!A4F2R9G_pg!b_OA_O4ZVXni3sf4SlcXVsbj4XALvNCfFsUJiGi1BlLOq99J4lZ70VmUBhdZdsU3NwSCSEG_BNfHHP8mfYG1vTBBEYw$
> ---
>   drivers/usb/dwc2/gadget.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> index e7bf9cc635be..bd4c788f03bc 100644
> --- a/drivers/usb/dwc2/gadget.c
> +++ b/drivers/usb/dwc2/gadget.c
> @@ -4615,6 +4615,7 @@ static int dwc2_hsotg_udc_stop(struct usb_gadget *gadget)
>   	spin_lock_irqsave(&hsotg->lock, flags);
>   
>   	hsotg->driver = NULL;
> +	hsotg->gadget.dev.of_node = NULL;
>   	hsotg->gadget.speed = USB_SPEED_UNKNOWN;
>   	hsotg->enabled = 0;
>   
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

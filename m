Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9F48368B7
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jan 2024 16:45:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90A6EC6DD6B;
	Mon, 22 Jan 2024 15:45:11 +0000 (UTC)
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com
 [148.163.158.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DAE77C6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jan 2024 15:45:09 +0000 (UTC)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
 by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40MElGae004849; Mon, 22 Jan 2024 07:44:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-transfer-encoding:mime-version; s=
 pfptdkimsnps; bh=X1B1R6wLPU9yyyRcXAxBwxXGa5PLOqIacXYIR1GEzEk=; b=
 U2t5yHk+DFa4eewRJSQMrAdTdI0E9GJTGTfVOutA8EV2ERDuR0YxVTem2Hgn8GOa
 u4+XT8P0IQh3mPSob0RbckaPZRWljARrV3nXkxklt4r+6YFniJWb2/eWN1COBfmF
 bw6BRnbj+wUYkyMnZzP71simmlNYFPUNxspSwz+coa/jck15ZSeTe+v5tT6P4/pN
 AFtKD3Kb8VVJK/3Xasnsivh+XyydR0szjrvHpaphs9nE4RRz75YuCSzkIehM7YBa
 Rt33spa3h0ndZRqJAQV8HTbArjvHIAP3pBVti4mh/TmxdAzKrPNhDHy6THbcUW0w
 g3byfKSnPEr8JIilM47oLQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3vrdywg29p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Jan 2024 07:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1705938275; bh=X1B1R6wLPU9yyyRcXAxBwxXGa5PLOqIacXYIR1GEzEk=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=WNXztdLVNGQIE9m5zYM0aW9U+AeznRjNYDpKWaUwi6Uhrywh1xIH4tzlaMlwqt8nS
 Lr4dbgNoRw9fBCn20gvFRFqCqWmKmNZL87fU1VFvIWcE+cHo0gZKCsZBacRPxC8jyF
 Ln6sK1cYGRUWWWvdcJ33m3kb+C9x9FaMJBJIKQx7EEmeF4nxRPwR95UAiDE8EmXv1T
 AI6Xn35GLkrl6XdgxRmXZ2EZdi98nqt2jQ7kJe5aZHsWZBx4lyiDryS48On5nBvS15
 mbAwxoKQmjcOl9dyLWHZXBtRFEleqtBTi9aR5UiCHomlvH1YNvDgyas40Mhb8QG9mM
 quN1StxUBktFg==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits)
 client-signature RSA-PSS (2048 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1084B4054D;
 Mon, 22 Jan 2024 15:44:32 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id ACB0CA00DE;
 Mon, 22 Jan 2024 15:44:30 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=ouYu6Pon; 
 dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02lp2040.outbound.protection.outlook.com [104.47.51.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 81A65404D6;
 Mon, 22 Jan 2024 15:44:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qp6b5FvkiAzBJWmqPI2LzzpHicPfseSRL2zGyzzwKOEVUj/CsLdMP+zZ2EWlEkUPmG4qX6oxso3FTY7X1IAGbgnxsEKk2Bs6FYmWZRrg0OWtw2Ovdy4MGW1xYpfFBpu3bBl2sM7z6Lb9o7MMLQydWDQ6GjBRkCoWtqRR19Tc3TkvBZI6mhxPaH1dC+djqVVQYTw9/zOQPm1EHpXBBNyoQrPEHbqFInq79EVDICjExRZVrIePrB/RnmfRGw0C4QLMSyyCwWhVcwwXEmyOLARwmhlzJ+8Uqb8Yr1mTsakVON7FxI9M9RrYQm2sI5/HS3hwUNeFogmVVJpuWPHv9VQKLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X1B1R6wLPU9yyyRcXAxBwxXGa5PLOqIacXYIR1GEzEk=;
 b=UhjfhVSYSPd3GFIhTiwFOH6eRkhGTuVWxEXtWDxgb/Vntpms738OtCnjAFqmXUmP1x7J4Dh8YR/iQm1Wa58XxZ8GusddMZSV8hTAEJwJ4NqUoP+56WumRaVciI+fQ8AoCpvlUhymHkOJblwOPZMpzbhtAln8DTlsZvla7/TWBp08QFGLBk6r+n/Q7ul9Z/jEVRZke0vhrVcPM7uBU/GeRkz9pMcau9XEsS/CYkAXGEaVQwh5daHbv7TwvHVbLZYQpp0u7AJgwysBJT+iQ+o5fbGz/2hLXmrZvFfnRNtIto0tJGi0cpnFamA9B0kjWn+NMnNLXFOPGcHrAabShFzo6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1B1R6wLPU9yyyRcXAxBwxXGa5PLOqIacXYIR1GEzEk=;
 b=ouYu6PonHmsJzbiEHYuiCCqogv9WL+qVD5A3E3AL3gUcO0UcypfwU9NnY+aLNf7ADaZGShyHi44jcS0cr0vrOB5k5ALaGF1hipgtNBZNeaMki+MW4i9VGg5NM5bs2NL620pzXpr8DgrTLg4Vn3/XTVx/kUvMexSogJr4nuSU6JA=
Received: from DM4PR12MB5088.namprd12.prod.outlook.com (2603:10b6:5:38b::9) by
 MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Mon, 22 Jan
 2024 15:44:19 +0000
Received: from DM4PR12MB5088.namprd12.prod.outlook.com
 ([fe80::5d56:80df:e884:3a2e]) by DM4PR12MB5088.namprd12.prod.outlook.com
 ([fe80::5d56:80df:e884:3a2e%6]) with mapi id 15.20.7202.034; Mon, 22 Jan 2024
 15:44:19 +0000
X-SNPS-Relay: synopsys.com
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: Bernd Edlinger <bernd.edlinger@hotmail.de>, Andrew Lunn <andrew@lunn.ch>
Thread-Topic: [PATCH v2] net: stmmac: Wait a bit for the reset to take effect
Thread-Index: AQHaR+f2GstLsKb9/0S+PUQyg8BFNbDdCMAAgAExZgCAAACJsIAChBOAgAAsIgCABIFvAIAAlR4A
Date: Mon, 22 Jan 2024 15:44:19 +0000
Message-ID: <DM4PR12MB50880D31E415D0DD95D991F9D3752@DM4PR12MB5088.namprd12.prod.outlook.com>
References: <AS8P193MB1285DECD77863E02EF45828BE4A1A@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
 <AS8P193MB1285EEAFE30C0DE7B201D33CE46C2@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
 <6e33c038-45a7-4941-b5d9-ce5704e13d48@lunn.ch>
 <AS8P193MB128591BBF397DC664D7D860EE4722@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
 <DM4PR12MB50883D41B18E8627FBDF5E32D3722@DM4PR12MB5088.namprd12.prod.outlook.com>
 <AS8P193MB1285B34B71F3143FA9B0A053E4702@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
 <DM4PR12MB5088435544A3D355C94632DFD3702@DM4PR12MB5088.namprd12.prod.outlook.com>
 <AS8P193MB1285D9F82E8065739C0AD962E4752@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
In-Reply-To: <AS8P193MB1285D9F82E8065739C0AD962E4752@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcam9hYnJldVxhcHBkYXRhXHJvYW1pbmdcMDlkODQ5YjYtMzJkMy00YTQwLTg1ZWUtNmI4NGJhMjllMzViXG1zZ3NcbXNnLTE4ZGFmNDFkLWI5M2QtMTFlZS04NjNjLTNjMjE5Y2RkNzFiNFxhbWUtdGVzdFwxOGRhZjQxZi1iOTNkLTExZWUtODYzYy0zYzIxOWNkZDcxYjRib2R5LnR4dCIgc3o9IjI0MTUiIHQ9IjEzMzUwNDExODU2NjM5NTEzOCIgaD0iWjNqb3I1cFFPOWNZRm91WjV3STVTa2RHWHVjPSIgaWQ9IiIgYmw9IjAiIGJvPSIxIi8+PC9tZXRhPg==
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5088:EE_|MW4PR12MB5667:EE_
x-ms-office365-filtering-correlation-id: bbccede2-2c51-40c1-fc95-08dc1b60ff1b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PlW8B+Yr+6TTBeD47HUxNfB7e2mAgO776JokbuHYtBbimJpa9LUiP/Tmqzmwhdo/I42CGDCLutBtOPncNBEu4PM0o+HLRh+Zh21xgLtlX85JVfumDxF0555NR81AiGCnTFVKahdtDwDt6kUBdNgNcwxYj9UQYhQEv9R3Rx0Lyc1qRLgxJCRoTnipdgBc2SX0sXJXkpVAwhftJq29Kt39fCwYsUNAy/OziOlRnZgwWPz5QxS61Hvg/EWiGPjJWOcv3EBVs5mVn2cp5XAJerw49KgCncDGx2ARLqLNs4Q01hR6FnByiXreuj599dFEFWRi06rwXXLMkq2Jtw3KJdWFlR6foUkApVhCAD3+tS1Dhkvd4lAICsqZgky9RQD83ekgBxK46QHpVg9jHzePIHviqrNhxWbM2pVcC416SMcMU5awPsZX77pTTUGzY1n6hX6V3kAsAVoxbI4PyWHlhkMAkpKau4OcZWc7RcXPfD3Wx744kjHcGfoBT0xKiwNlmZ3nTRyJV2mhGuY9DbEEYUqRndtUJ5n/adQhP16m0rw5tpFjDikZzHZpGtk2M5jQP7/tqjKM+kMkp5vsSSrYNvkkh18rczeGD4K/WmsA0Ej+SdX3N9DPNtlrPjqxINpEhTg1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5088.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(396003)(136003)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(71200400001)(53546011)(38100700002)(41300700001)(86362001)(33656002)(2906002)(8676002)(122000001)(7696005)(478600001)(6506007)(316002)(76116006)(66556008)(66946007)(52536014)(7416002)(83380400001)(5660300002)(64756008)(9686003)(4326008)(66446008)(66476007)(54906003)(107886003)(110136005)(26005)(8936002)(38070700009)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MGFOUk5HV1BNWkJ5VWxZOXNlWUxERlJidWFiQTFTcGdiZlRRMWhPMFZad01o?=
 =?utf-8?B?UU0veEpZWHdicHFOQlNpRU5ydnBYUUhpZm9RWUljY0UxeXlWMzYrT1V5a0pE?=
 =?utf-8?B?a0dob3NWVnJYMjYyVlIvZ002UmNGL0RhYlhXVlNHR0xiZk84ZHkvdHQzeHla?=
 =?utf-8?B?UTNNMWRWOE1Jc3lMOGZna2U0SW5rc01aSDVBdWxGQWx1Y2JvZXNtRWt1WEJt?=
 =?utf-8?B?WmR1K280NzdTQkxvSUllUWRZbzVFSW1DZG1nZXFXc2hHeHIxU2pZbGhjMW9E?=
 =?utf-8?B?WWZ0S2hVYWFiQWNYSVJ2a1RDd0hhQnZ3SEUzU3c2dStnSnBWNTdYNXRDZTEv?=
 =?utf-8?B?OW9hVDZLdE93ZVF6TE1LUWg2c0g1dG9tWm5JMHVoU2lBWkJvTjhXYmliSnc2?=
 =?utf-8?B?SXlSM3RXaVVGRU1WbkdCTk1qR2R6aWx1enpVcHA1WGZaVVlDSkJna05CQ1lq?=
 =?utf-8?B?bzdyTDNObEtHemFUd010NVdEK3ZYVFZ6cTBEcFYzKzBxclhxNjVvU1JDM2Mx?=
 =?utf-8?B?VU82R0NhTWxlVjFTMmo3QXNCL1pHcExWMHhzYldPNmdhZWl2N00vVFdCSDcr?=
 =?utf-8?B?SWN6aFhlMU5rNDVhYTB2YjNXWUJ5RlViYUlsRWlpbWFDNGJyd3d2dmpMTWo3?=
 =?utf-8?B?U1ZDQUhiRS9EQTVLaUlhUlRSak9wSWsxOG8xRGxGeUphcmRKZGJtb21MMkNy?=
 =?utf-8?B?cGpzbVVSSUpUTU9qb3RTa09uYWowemJibWxGUm9PNGJkL3VWakF3RUFCcmRL?=
 =?utf-8?B?VDg3VnhFbDY0Y2ZON2puNkh3dlI2cWF6dVRYcng3Ymh1UlRsUHJuRnEyTW5P?=
 =?utf-8?B?RCtOMmtnNVF4MkZaMS9FdW5UUlRSMXpJb1pSckpLWHVBaCtFeFhqRlJPMnpz?=
 =?utf-8?B?alNla2NVZ0dWME1td0kzK1AwdlpqQlQrSW9WWEVnVUcwa3RaMEpRSHZERVp5?=
 =?utf-8?B?L0xrRTloMlhJWFVJSWpnZE1VZ1RoMFc3QklVZ2ZHS1FNVmhuTDUyaXJpNWZk?=
 =?utf-8?B?UE5IZS8rNG9lczNqRHRXeE8zM1IreU5CcW5UK2diQ0RHU1R6Sml1c2dRaGJ6?=
 =?utf-8?B?Wnk5bmhCWjBZSWNsVE5QOHI3UVBmeWx4eWZyS1FpS2FYZlhaTllSc3hleU12?=
 =?utf-8?B?M2ZtWElPWGk3RlhNbFBWZ2RhcExmSUZTeFhhZThuNkpIT01BbzExSlhONVh6?=
 =?utf-8?B?ei9FNTFBcm4yNGZOUis0R09MWXIwNFMwYkFXNUNlcFd6VE5mc25yWFFsS3FY?=
 =?utf-8?B?elNDQjQwSzB0ck5rcmxwck8vcmRuc2xrN1hCRmlWVnlMQ2ZNc1ZRMS85clly?=
 =?utf-8?B?MHh1QStaK3N1ekh0N0h1Q001TWxMTXQyNXdMU0RLeGEvakswZWpaN0hQY09i?=
 =?utf-8?B?VnZDaGhyMkZ6MzdTS0ZLMTJFdnFEb0NOYmlPelA5ZW02bzVCcWg4ZzRFeHZy?=
 =?utf-8?B?Vjk4cXgrRXFzYVY2WENWWE8vZlZIaTJ3SG8vRXBmSnAzeDVhYm05cDFRMWJB?=
 =?utf-8?B?blJ6V00wZU4rVUliTDBLNndyTWwvNkhkNmtVZDcvQlZOeUd5eEphZXplRDdo?=
 =?utf-8?B?RlpVK2dFY095bGlqVGJzUGFuVkJSVXMvRFJpQWZwM0ozanRNZGk5MW9JL2hB?=
 =?utf-8?B?b3RTUUJkbFl5S1RVWk52UVJTQUhxNjZTcG5TWG9jRDB4YVBxL0UxWlBvSWJk?=
 =?utf-8?B?dHpKd0RjNlpKVVJoMkU1S2pBc3c0bG1waXpYeENQclpzZHNNYktJbWhrajVV?=
 =?utf-8?B?eWRtS3lnbS9vckZPVXpZbWNjbExKNHFyV2E3TDhpelRGZE51akdFdkQzSTFh?=
 =?utf-8?B?S2UyZE5GVUpFTXQwNUs0b3RmT1BtUlJYekpBWEl0WXorY1QwRHRMTUtmN0RG?=
 =?utf-8?B?Y0Y3ZTNRbHF6K3FSQXZ0WTdzMWtub2tsb2szZFNoS3hWU1lGWU1oVkRKWkdo?=
 =?utf-8?B?dWtpUlovcktEejdhemc3SFhGMjVpRkF4Y2hZd1p1cytUWXhRNit2V1IzcmQx?=
 =?utf-8?B?U29ITWdVaUFNRW5OYmJBNExNVmcrWmpqdndFZzN1RDVaOXRBcDZVcGNQNzB3?=
 =?utf-8?B?dGJaZUdoS3IreEZrbElkZEVSSEZZQ3JMaDRPNzBQQkVXM3FxM2EwZ01DREhk?=
 =?utf-8?Q?7pWpn5cA8YGWjeib+PbAQZnUb?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Hwmq7jdcPfPkmNqJlw11RpCY2ZxK3YYFQcKYjgtVjr8ZfE4ucr7r2e3PFISbPESCgslDfAGV63EViPDYZUjGSwXxZgVVH6sJuWGD7jhEBKnvaALl/wfmhvThplyAlp77tnvHQpPKJqjC/DgpYVXvgrlnkn7jmP3RKNJunLqwDYdJB4tePVPANADoIHxbHlpJWJVpcOA22lswn8DM1sfRnJSlk1YDECeYFhLp8Oz+ivXpddu272/VQYwk2muXHtnTA7vk5Dum2/ZtVY0aSadJEFRDNdM+W15Fg6CYtRMChP3tnvmfdJCcEtpMeJhZJrL5zyXAemq9HwAi1rpopwnKR5xVQH5HdWSdbL+akdYiWMPC/UwVhwLBpD2nH+IK8D8XsNzbBeuIfct2ss3B+CAXfJIkVhHHsnqArohRiHCaw0oixRiocvMdTeU3IWUZCe75/FRcdCx9TQc29ml+3DWtjsgcYGAmjro2n13t3A2eu5SvuwVjBNl+/YzSHI0dof2gP/Wp6dJVzAgrY/0PgRCDctCwSLLLeJ+Uebc3AjQH/t2Kwo3UN0gJGr7nLKBGjrDjX+2gd8in54r4ZzVJoeCEHlJ55PJBVpah1wm4EpBVHGTNYR+N5yloLVXM28YAovjW4mXtJ7P7aVXDEHIiYEBwtg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5088.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbccede2-2c51-40c1-fc95-08dc1b60ff1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2024 15:44:19.0557 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QUOCSdV4LBDvbn7dkphgRmnfIyO5j9Y74fbqai6N3gOzWwvs3D4gzCW3YcFq23ABXTsR1gFVA7NlWZYhxlp+xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5667
X-Proofpoint-GUID: zfngRYfthnivuaEmr8e_ANuYU7VU2UKQ
X-Proofpoint-ORIG-GUID: zfngRYfthnivuaEmr8e_ANuYU7VU2UKQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-22_05,2024-01-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2401220107
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jiri Pirko <jiri@nvidia.com>,
 Jakub Kicinski <kuba@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: Wait a bit for the reset
	to take effect
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

From: Bernd Edlinger <bernd.edlinger@hotmail.de>
Date: Mon, Jan 22, 2024 at 06:41:46

> On 1/19/24 11:38, Jose Abreu wrote:
> > I understand your point, but the delay should be on reset function itself, since it depends
> > on the SoC that stmmac is integrated.
> > 
> > Please refer to reset_simple_reset(), where usleep_range() is used.
> > 
> 
> Okay, in my case the SOC is an Altera CycloneV and reset control seems to be an altr,rst-mgr
> which is indeed based on this reset_simple_reset.
> 
> So it implements reset_control_assert, reset_control_deassert, and reset_control_reset.
> But the above mentioned delay affects only the width of the reset pulse that is generated
> by the reset_control_reset method.
> 
> However if you look at the code in stmmac_dvr_proble where the reset pulse is generated,
> you will see that the reset pulse is only generated with reset_control_assert/deassert:
> 
>         if (priv->plat->stmmac_rst) {
>                 ret = reset_control_assert(priv->plat->stmmac_rst);
>                 reset_control_deassert(priv->plat->stmmac_rst);
>                 /* Some reset controllers have only reset callback instead of
>                  * assert + deassert callbacks pair.
>                  */
>                 if (ret == -ENOTSUPP)
>                         reset_control_reset(priv->plat->stmmac_rst);
>         }
> 
> I don't know which reset controller that would be, where only a reset_control_reset is
> available, but in my case ret == 0, and even if I could get the reset_control_reset
> to be used, the issue is not the duration how long the reset line is in active state,
> but the duration that is needed for the device to recover from the reset.

Sorry, I indeed missed the fact that on simple_reset the deassert is done
after the delay. But my point was that what you are facing is expected since
most of SoC chips need some time to recover from reset, and this time is
greatly dependent on integration' reference clock value (lower reference
values cause "recover" to take longer).

I have no objection to your patch since it's indeed a very small value, but
I believe reset framework and/or Altera' reset manager should take these delays
into account on deassert, since they are expected to happen.

Thanks,
Jose
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

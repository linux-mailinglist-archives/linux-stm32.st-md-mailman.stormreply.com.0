Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9738D8327BE
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Jan 2024 11:40:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B66AC6DD73;
	Fri, 19 Jan 2024 10:40:09 +0000 (UTC)
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com
 [148.163.156.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B120FC6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jan 2024 10:40:07 +0000 (UTC)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
 by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40J8dKTk030837; Fri, 19 Jan 2024 02:38:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-transfer-encoding:mime-version; s=
 pfptdkimsnps; bh=dcJJ2eFTc2hGCmnN/cGirFs8yOIaQHVO+msgdqKTf2I=; b=
 HA+smDKwm9BgCf4VWUqAvo76P14n+p2fFJ91v2Fwkutrq+jOthRhLbNcCox4MpVd
 07QwJ7jCQ9qahudYBKdf3UriAEcxPD5GlDjDayaypgFkJSzFdcQ2NmlpUMwMtoeY
 RKaehC+/jqdbzYMx22rm5JZ/kVVWVSWuwN6oTmaj1EHPzxnEKGyk9dFNyR6Oujgf
 w0wM1/qisV/CFqml1uWqHCtgPeD2sOWvqzVnbaZXEAa4CEJXs/m7LQqZH9tdQmcr
 BhtrHaYq4/Xfq+p+DdjhWmKhKlpjExoLEJK0D/Vs1L0mSzFF+WyDUGh9kZ3zMJMu
 OMm5vHZV4NutUeBzYZDDrg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3vktn6n6x4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jan 2024 02:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1705660724; bh=dcJJ2eFTc2hGCmnN/cGirFs8yOIaQHVO+msgdqKTf2I=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=JH7EfLuz3KxxXlfx1ujOdd26kDkM8NKyOz9LYH7IDti+lYyt5s450ORH8qUN9U/Al
 OuHghzeHWQVmZMrQTtU6bmPbeQuVk2HRwg68/rtrSblE9UHYG1NIu6DICUO12BJP3m
 Z/HhGxIJAnXTk0Avii/FbzewCmYeH81PW3ZNsnsdo11666JzPtaJ/0REw07CoqNRIO
 rWmoQDdL+oXr1df21tBWXlZ5tmz0l5oiUUTL7KvZ59SjGPTe5vF2VLcbDIqbA0vzwc
 GiGDLHNHEqiDYQwtHNJ8pWfE1FMPTL3ZTNLW/OYEcxr90wrwV9ESqnfsb7bizBdEy0
 0LnWNjmxCZRpQ==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits)
 client-signature RSA-PSS (2048 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4640040523;
 Fri, 19 Jan 2024 10:38:42 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id C9992A00C4;
 Fri, 19 Jan 2024 10:38:41 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=ZI1Ql6uO; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 4701440169;
 Fri, 19 Jan 2024 10:38:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fGsYB45tmiUiO+xG3CiJ+p6elr+6H9pmj40Jl/eDooAI4uGFLBNpYkBmpUpqgvJwS80QYIE81QWrPIwP7iRjntvhACpqQL/Ga6JffP4pG9zY5seKmQbJj2udT0YNAgIHz1G9ipU1hyCSDgkK2n2zVatXIO36H2mGyXIqxUYD3G8NHwiF6DXx8xJUpZny5djFEpgCatZhHSbm/t7f9zhudtwSyXdnXP7ZOtmFsXqrsyFz1vRywU5Du3IKNiTH0/sQVw6QYm5JqWGP2Jmq0XhIxZuJQOa8te3YH3oCMJk6BUYSM3YoxXpsm86FUZU7P1jaYgMH7TiMUd193DoU8hQbzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dcJJ2eFTc2hGCmnN/cGirFs8yOIaQHVO+msgdqKTf2I=;
 b=jJbheCLWl6gOPjdPkjMN1sRc7ARyAq3pAuImIrYAJHeIgs//cSTG43E7QeCQidrulzlB9kbq/Qx7BQ9xAk9jb9WayE3w1Oegh+btb83nPXcMa9GOyxGhDJA0UjCWWM6erIub/EvYoC+4OesYWFwnLMEYmNZaZz9mPpiv+4L8JdyUmCtxqjfCWSUR6jj60xz5HcsGItLyN+TimCazy/8lc1HrJplSuOofAgZ3IYkZjKI0RyJFzKn7MxDqD7aahcmR2vhctf50JDRHQNrXMm9UGWiqPSVpPM2lmg8Fk1a0s0tW5e0N4tDfpVeYxc8ve6s6MqA8wsAMBVUpX60+Bk3AuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dcJJ2eFTc2hGCmnN/cGirFs8yOIaQHVO+msgdqKTf2I=;
 b=ZI1Ql6uOHHqHER3vEQe2bI839UFgbUG2BWU3MNncfT5PCJvKP8R+lOTKWs7kWkzfJpUT1bXNMY6HdfnAb3T3LSY/jDo6FXu2Bm8U8H8KRVGACwrNhCiYTQ7Iur6V3G3lJhljSLLxq22w+TqP4p6hmgYuvpMVVXPcuTNkBTAG4/w=
Received: from DM4PR12MB5088.namprd12.prod.outlook.com (2603:10b6:5:38b::9) by
 CH3PR12MB7617.namprd12.prod.outlook.com (2603:10b6:610:140::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.26; Fri, 19 Jan
 2024 10:38:33 +0000
Received: from DM4PR12MB5088.namprd12.prod.outlook.com
 ([fe80::5d56:80df:e884:3a2e]) by DM4PR12MB5088.namprd12.prod.outlook.com
 ([fe80::5d56:80df:e884:3a2e%6]) with mapi id 15.20.7202.026; Fri, 19 Jan 2024
 10:38:32 +0000
X-SNPS-Relay: synopsys.com
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: Bernd Edlinger <bernd.edlinger@hotmail.de>, Andrew Lunn <andrew@lunn.ch>
Thread-Topic: [PATCH v2] net: stmmac: Wait a bit for the reset to take effect
Thread-Index: AQHaR+f2GstLsKb9/0S+PUQyg8BFNbDdCMAAgAExZgCAAACJsIAChBOAgAAsIgA=
Date: Fri, 19 Jan 2024 10:38:32 +0000
Message-ID: <DM4PR12MB5088435544A3D355C94632DFD3702@DM4PR12MB5088.namprd12.prod.outlook.com>
References: <AS8P193MB1285DECD77863E02EF45828BE4A1A@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
 <AS8P193MB1285EEAFE30C0DE7B201D33CE46C2@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
 <6e33c038-45a7-4941-b5d9-ce5704e13d48@lunn.ch>
 <AS8P193MB128591BBF397DC664D7D860EE4722@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
 <DM4PR12MB50883D41B18E8627FBDF5E32D3722@DM4PR12MB5088.namprd12.prod.outlook.com>
 <AS8P193MB1285B34B71F3143FA9B0A053E4702@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
In-Reply-To: <AS8P193MB1285B34B71F3143FA9B0A053E4702@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcam9hYnJldVxhcHBkYXRhXHJvYW1pbmdcMDlkODQ5YjYtMzJkMy00YTQwLTg1ZWUtNmI4NGJhMjllMzViXG1zZ3NcbXNnLWUyODM1OTgwLWI2YjYtMTFlZS04NjNjLTNjMjE5Y2RkNzFiNFxhbWUtdGVzdFxlMjgzNTk4MS1iNmI2LTExZWUtODYzYy0zYzIxOWNkZDcxYjRib2R5LnR4dCIgc3o9IjEwNDIiIHQ9IjEzMzUwMTM0MzEwNjUxNTc5OCIgaD0iVThSREFTSE95VzZyUklLbkxIQ2JEYWQ1ZlZrPSIgaWQ9IiIgYmw9IjAiIGJvPSIxIi8+PC9tZXRhPg==
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5088:EE_|CH3PR12MB7617:EE_
x-ms-office365-filtering-correlation-id: c4f948ad-2ed5-4ecd-de26-08dc18dac877
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qgi1PkT9AalN2fD6GSJIyqpg90GVA2he8/yCmrZscD0Y70y554pnXWCJ7zVM9C+lVIALGeTxGN54uQXzdWJI3lDr80tRh6nghPToTOOiXrxXoi2HFHSgV4cxMlIz3DeCazvVKvJzlG3FddJM77pmRYDLKO2sDijEjbPZAT9zJyeqbKvUfhS9pqIAYaC2Xrn9xw+Il3iW1CV/aC29ApyuBu8l1SwS3iSVQfHU6PKIfBoqAVMvZ1UXbyPVZ0Pa7p+4+dPmqZ7ti8WfTenrEFuploXGcjUIkz+UayM/iIHNLC2TraKH4Azh4thO0rCAXT1JDvvsnplhfvdeTYWjDtDeqmh/oCMzybw0KkjH6fyyBhzGxJlMUYuUQwnzzFIuJYZo3l+0NGewljF0gqhTcmeLInWNepmkQpd9RCDPkfti7wSUfJfbYQFVaIlIR0Rj3rmskNWqHch6hNXYSk1hxnKJNw2CcU0RDVjPN3kyEwInHpK2jZBWfOmk6nVLeHWqqcWyHE9LvEk00J5IDHu1YnQfWvK0FdO909eT5e0KUJ4+L1vGhs3b/oKPsrvwcCDRGsfDPkMgpMwMCTDKVyFHhvRGxXGZtvwxq+LtGH1p15YiG0qSOuqAoUZLAXaSJ8XSSENf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5088.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(376002)(346002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(83380400001)(71200400001)(41300700001)(478600001)(38100700002)(122000001)(55016003)(26005)(9686003)(53546011)(7696005)(6506007)(33656002)(54906003)(86362001)(316002)(64756008)(7416002)(4744005)(2906002)(52536014)(8676002)(4326008)(8936002)(110136005)(76116006)(66946007)(38070700009)(66556008)(5660300002)(66476007)(66446008)(107886003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VDVIaGVqN0lFbUNJSzBEdDBZcW1Rc2xVRDZqVUVkNjkvbW9qNzZONnNScGxt?=
 =?utf-8?B?cC9NQW4xM0VzYXZ2bHRHQkNNdmViOXVtb3NyTTdRK29Sa2Q1R05TYnExL1BW?=
 =?utf-8?B?eHc0aE5NZmdDNUNyZUp2MkdMa2hjdFNEWXAySlRUYzRHRW1vN01HQUdyaExZ?=
 =?utf-8?B?Zk5mQnluMzIwNU5Tc3lvT29ZS2o1RUxTU0RsYytTbjZaSklMczYzZFZ2Y0Js?=
 =?utf-8?B?ZlBmOVFFNk5BTlRQdWE2ZHlNMXNSMi9QWDlQd05BVCtTWEtOTGh6eVdpbDBy?=
 =?utf-8?B?T3FlV1AvcmVKd1M0UlRRWE9UVWVKbHc0Sk9JN0IxVDlsaFdwZUVENWs5djlG?=
 =?utf-8?B?a1hqMHRpWmMyREVKRE9veVFUU3d6RDJDODFGRW9Yc3dTSFByM1hraFpYaWIv?=
 =?utf-8?B?UU0wQXlSRFFIWDh5M1VpWThLcTU4UnN5amYyRFhMc2lQb0ZGM0hITUREWllS?=
 =?utf-8?B?ajdTQlovRWZvdVJYMDhrV0dSK2JqdUg4SjZCQ2M4ZVdnQ3JaMVo3QnFmZk5F?=
 =?utf-8?B?alFQYlM3aGgvQ285NU1yWFRtUkF5ejRMQnhlclVESFRqNmpvcVZ2ME1QVktl?=
 =?utf-8?B?ZzdlL1FoVnpVT0UyL0NLVyszaE81ZDhPQ1Y4VE1KTUNRbmk4Y1Btay9vaFpB?=
 =?utf-8?B?a1g2cjhZZXBaODZuclpZUTZuUFh6aTlQb3JFaVBjSC96VEJXckFPSFlHVkJL?=
 =?utf-8?B?U2svbXdCVGpjN29sNmFRazFESVVGdDhOcGpCS25pWDRUeitGbFZNMTNvdTNy?=
 =?utf-8?B?K1Z3cUhYTmtXQ0FYM29sOGlkUGxoSTEvUi8xeUZFcFJPK3U1NElwakdOMXd1?=
 =?utf-8?B?K3NmVm4vWTF0aUdTWVZzSEIxdDdkNzROYTBiNG9sdm1Dejg0R2lvY1p0N00v?=
 =?utf-8?B?TzRjenBOK3Z6SFZZZ0FaeWdGQlR1WnVmSGYrMDJGRmMxNEJLN0pUQXplWGxV?=
 =?utf-8?B?dXQwSWljZ2VINVV3cVRrVlBwTitkVTNIMDlTdndyTFNDWnNIUEFLZVVXY2w1?=
 =?utf-8?B?YTF2VFZzMzFOV0VtQ0VtZ3VTcjREeDdYbWhVZ0RXS2YzWGlRbzFocUhzbG1C?=
 =?utf-8?B?TzV5d0gydWFrcHJJNDZoNy9mSjRsazJDcGsxYUt3Z0thZ3ZNb2xGNEpKdTJQ?=
 =?utf-8?B?NUM1eTlQREtHRmk1WGNoeWRoS1daQkRsY1pOcDVxOWlkTk52ai85YjRkVDZ6?=
 =?utf-8?B?SkpENXZqZkZHRElYY3RHMDNlbktJcDB3MSs0QTlDL0J4c2tGN2p2YVdMcDFj?=
 =?utf-8?B?MW5WeHFXQ3k2MVNJV1R2cFdxcm52Smw3SHpPMStJbWlnbnJHWTFGczNSalNM?=
 =?utf-8?B?ZC9zbFN4clg2QnE4djBuK0EvWU5MOFJZczlnSUZPN05QSG9tUTRQejhPcHkv?=
 =?utf-8?B?SFZIci9GN1lSQWJtT09pQmFYM2hWR21ibjVxRUtsUE1lTCsweTJEYUNYWGsy?=
 =?utf-8?B?Kzh5SzdNSi8zTTFzdUQrdGIzRVBzMXp5MVZZNzdWWTc3emxyKzhJek1VN1RT?=
 =?utf-8?B?NEVOV2N1STMvV2pnN1BJR0FKNmw4V1BDZUxFV1pBVGlaT2ZEYUpoMUpZYkNC?=
 =?utf-8?B?dldFQkZwak13amVnV3gvOG9BZnhlcko2dVFvMU1jYnFwRityWkFSR3B5QTZi?=
 =?utf-8?B?RDZiZWwyTW95R1BTbTRoOEJZYk5mMmQ4aHNyelNuNjUwNFVOMTBPZDVwZm90?=
 =?utf-8?B?ZWZxQnlMdTJlelFYeTYwMWVLSTQwaUFBSElhd3pSRnhwRWJqbmkzdFprbHE0?=
 =?utf-8?B?YllNRG0yOFZoblg2L2RsVXllcHZKNm9PNzMwV2Jqb1pBNWtieUpVaGFEdEhs?=
 =?utf-8?B?eHl2VG9CNlgycU5QQU5ZU2VLMlNhTStLVWVraCtBWEQybkNwZHZjWVJwY2hE?=
 =?utf-8?B?Z09rcFBlbENKTklHNHdjQ3d3THZSdXlvOTNrcGMvWHg0VE5YeVp2ZGZnbExx?=
 =?utf-8?B?R2RtZVR3YS9JT2JLTjBMbXk4YzA0THQrWDFPSCtFV2NWMmc3SmRsTlA5ZUNo?=
 =?utf-8?B?WWVTbHVwaTUrNmpNVlErMnhJaXQ0TkVsMVU1Wk9yRGxjRTlEcld5dUFvczFS?=
 =?utf-8?B?QWVqeTV4Z2cxdTE1VXErSENPUTdOVHhHellHQThqSEhoaG1zbzNsTVdDa1Nv?=
 =?utf-8?Q?BvjZ/ODtkQSKf4q1ajrDxUdfx?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: rriDINz0RDY7/jBF1Jz88dAc5JrI8t1MdPaoZt+nR0rta+I8En753b2++9nM1+TYCfN8Nz+WbLkUso7NQu6zrTSyglsGM38y+/rLsNJXeHgQG7uL1pYngREdbNDTZxN3dz9GAoIsM7jca2KNl7mCqfQWpkqQj4RgFDAHYun6M8SXQHLlUaCDNFnlAVKSzNO63etSuCu2puN6La6VFX+fcj/pLq+iWlyPglRQFeKzIBSxHSqh9X2QI6FAo5BhwfogGWUBGr+fJMtxhKPBfcbuBK3CMJ4IJrIbsca8pvWKj/gDivld8+Y2itslx2dH4xp7PjoWhJav/ZWH+yoGXJ+kc7uKSlYaN+SVEPxviMN7UfACfX/MDRnaI6eVMkE02/t/H2z/vmwruDGDDFeSRalMHQQ5KT1AmBLgldyUh3HQZhICBdQGBHtWXkPC9kFN6cJleho4/fAROCU0UKNtu/7U4Yc0jayZhlAhz3DmkkV3cU/lf9oDqxY/efgkP95QNS4mUjEm8/i1RZJs2OYJMmpU57SAavTag8O0vas7ENiAomtpV3T9c2Wrszh/s0viRA22u2sn6u5ybVRlXv3NBtlkXB1gBEd1yh61s/XHlsed51Lu9ueEYFVRvDsJPeTSbgappfmvkIxJodacyK41IJ5+Wg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5088.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4f948ad-2ed5-4ecd-de26-08dc18dac877
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2024 10:38:32.4356 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZPZbcQ/CsOixI7PafXUhD9Q60w2zlQuRmKQwVjp8JLbktEG/sPpj75EdQcFreUv0OQTTs9GinPTyGiw8cuHj+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7617
X-Proofpoint-ORIG-GUID: ysCd1YRhiOZphFvOlxOa3s-WDRkIs_pG
X-Proofpoint-GUID: ysCd1YRhiOZphFvOlxOa3s-WDRkIs_pG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-19_05,2024-01-19_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2401190048
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
Date: Fri, Jan 19, 2024 at 07:15:31

> On 1/17/24 17:55, Jose Abreu wrote:
> > From: Bernd Edlinger <bernd.edlinger@hotmail.de>
> > Date: Wed, Jan 17, 2024 at 16:48:22
> > 
> >> I don't know at all.  And actually, I am more concerned that other registers
> >> might be unreliable within the first microsecond after reset is de-asserted.
> > 
> > Are you guaranteeing that the documented PoR time is achieved before reading registers?
> > 
> 
> Yes, that is the idea, why I added the udelay directly after releasing the reset,
> thus simply delaying the execution of the stmmac_hw_init function, and not directly
> where the synopsys_id register is accessed.

I understand your point, but the delay should be on reset function itself, since it depends
on the SoC that stmmac is integrated.

Please refer to reset_simple_reset(), where usleep_range() is used.

Thanks,
Jose
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

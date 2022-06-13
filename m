Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A53548155
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jun 2022 10:15:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FEB6C6047C;
	Mon, 13 Jun 2022 08:15:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A7E7C03FFF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jun 2022 08:15:10 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25D80q1D026381;
 Mon, 13 Jun 2022 10:14:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=j4qE4CmTOLx19pyEhsVTVJ4dGM7++a3J2NmTTXvsYqk=;
 b=EPUc7+MiS5BXCGfIiySRsWC6NvcAXPwukwv/vxIgWPnuMQx8XwZszulbaKyPkKPUPvsz
 rvDPbpPWfTvOJ0Sb+PFava+1lk6RiaENZoOxO92cDQ7t+URjL2gaoYIdVsRMwZ4MUOnk
 RmnWCy099u4GUQvotA9d9rnm6LNt6wQNju+JWFOpWyIhVflE3BQeCi7lIBPyzFlcglr1
 gs4LCSwIaxsV2yIVTHUEfOLyXoERNmF3TNbdtvwcvuKoVmY2+A4GUYUMy93SSc7SzSVl
 qiUBxl5HxNqZ1vbrtt9zRfJxV9D0+dMFm3RPgAGpRu5RvbklHX+olxIT4xr/69VGssDJ rA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gmg6a2jm2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jun 2022 10:14:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E391310002A;
 Mon, 13 Jun 2022 10:14:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DEA23212311;
 Mon, 13 Jun 2022 10:14:56 +0200 (CEST)
Received: from [10.201.21.93] (10.75.127.118) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 13 Jun
 2022 10:14:56 +0200
Message-ID: <feca044e-deed-6c93-897f-59ab8ed2ba21@foss.st.com>
Date: Mon, 13 Jun 2022 10:14:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: =?UTF-8?Q?Leonard_G=c3=b6hrs?= <l.goehrs@pengutronix.de>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>
References: <20220603094422.2112746-1-l.goehrs@pengutronix.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20220603094422.2112746-1-l.goehrs@pengutronix.de>
X-Originating-IP: [10.75.127.118]
X-ClientProxiedBy: GPXDAG2NODE5.st.com (10.75.127.69) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-13_02,2022-06-09_02,2022-02-23_01
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, kernel@pengutronix.de,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/2] ARM: dts: stm32: fix missing
 internally connected voltage regulator for OSD32MP1
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGkgTGVvbmFyZAoKT24gNi8zLzIyIDExOjQ0LCBMZW9uYXJkIEfDtmhycyB3cm90ZToKPiBBY2Nv
cmRpbmcgdG8gdGhlIE9TRDMyTVAxIFBvd2VyIFN5c3RlbSBvdmVydmlld1sxXSBsZG8zJ3MgaW5w
dXQgaXMgYWx3YXlzCj4gaW50ZXJuYWxseSBjb25uZWN0ZWQgdG8gdmRkX2Rkci4KPiAKPiBbMV06
IGh0dHBzOi8vb2N0YXZvc3lzdGVtcy5jb20vYXBwX25vdGVzL29zZDMybXAxLXBvd2VyLXN5c3Rl
bS1vdmVydmlldy8jY29ubmVjdGlvbnMKPiAKPiBTaWduZWQtb2ZmLWJ5OiBMZW9uYXJkIEfDtmhy
cyA8bC5nb2VocnNAcGVuZ3V0cm9uaXguZGU+Cj4gLS0tCj4gICBhcmNoL2FybS9ib290L2R0cy9z
dG0zMm1wMTV4eC1vc2QzMi5kdHNpIHwgMSArCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtb3Nk
MzIuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNXh4LW9zZDMyLmR0c2kKPiBpbmRl
eCA2NzA2ZDgzMTFhNjYuLmU5OTdjNDk1M2ZkMSAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9ib290
L2R0cy9zdG0zMm1wMTV4eC1vc2QzMi5kdHNpCj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3Rt
MzJtcDE1eHgtb3NkMzIuZHRzaQo+IEBAIC03OCw2ICs3OCw3IEBAIHJlZ3VsYXRvcnMgewo+ICAg
CQkJY29tcGF0aWJsZSA9ICJzdCxzdHBtaWMxLXJlZ3VsYXRvcnMiOwo+ICAgCj4gICAJCQlsZG8x
LXN1cHBseSA9IDwmdjN2Mz47Cj4gKwkJCWxkbzMtc3VwcGx5ID0gPCZ2ZGRfZGRyPjsKPiAgIAkJ
CWxkbzYtc3VwcGx5ID0gPCZ2M3YzPjsKPiAgIAkJCXB3cl9zdzEtc3VwcGx5ID0gPCZic3Rfb3V0
PjsKPiAgIAoKCkFwcGxpZWQgb24gc3RtMzItbmV4dC4KClRoYW5rcy4KQWxleApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=

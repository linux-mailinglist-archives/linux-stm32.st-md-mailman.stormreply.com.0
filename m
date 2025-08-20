Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FBEB2D896
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Aug 2025 11:39:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75C53C36B3E;
	Wed, 20 Aug 2025 09:39:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 817BFC36B31
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Aug 2025 09:39:28 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K9Y2ox000924;
 Wed, 20 Aug 2025 11:39:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 vlariyUg/2e3sM/3EKHYDRoybrUl8t7Wg/1mNFbV/AA=; b=8QJZqQQOdu73pxWF
 /8WRjLizsLGRCWdqzd6mc0DDZXQIQF9pNKeVdKEpnR3UBd8645bs3uAi/GOBIsL2
 GaABo7FcA1YQDNzmubKpKd2ZLrVG8i638heMKjcO0UdXkEN39LmKJSHUMDMyXrof
 w7Jy0gPxVBdero2AIz18ReBuzWE/IJ2BPKH77fRYftkM98jOjc00eTL9ps4eFZJA
 CZDy0+OVHszAdaV4l5nEOpkDESwzRoKXuCtqcLukr8dsTjqbhEZm19rUpU0by2Xc
 HHpqbY38qmmuB2lHlYISbw2mAHCfH9RGomTFOGXLCZfqlAfopJkV+N9sVWEOcBKC
 OsLtVQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48n6uj9dxb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Aug 2025 11:39:02 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 45DDA40044;
 Wed, 20 Aug 2025 11:37:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 623115FE4CD;
 Wed, 20 Aug 2025 11:35:58 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 20 Aug
 2025 11:35:57 +0200
Message-ID: <72c32584-26a8-41bc-9eb6-1b5c0b25a6b2@foss.st.com>
Date: Wed, 20 Aug 2025 11:35:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Baluta <daniel.baluta@gmail.com>, "Rob Herring (Arm)"
 <robh@kernel.org>
References: <20250819213831.1368296-1-robh@kernel.org>
 <CAEnQRZDga2cX=YPY5Z9NDyro94bxFjK9k5Xm5Vt2vVzf4ysKyA@mail.gmail.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <CAEnQRZDga2cX=YPY5Z9NDyro94bxFjK9k5Xm5Vt2vVzf4ysKyA@mail.gmail.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
Cc: imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-remoteproc@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Magnus Damm <magnus.damm@gmail.com>, Aisheng Dong <aisheng.dong@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Iuliana Prodan <iuliana.prodan@nxp.com>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v5] remoteproc: Use
 of_reserved_mem_region_* functions for "memory-region"
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiA4LzIwLzI1IDEwOjIxLCBEYW5pZWwgQmFsdXRhIHdyb3RlOgo+IEhpIFJvYiwKPiAKPiBU
aGlzIHBhdGNoIHdpbGwgYnJlYWsgSU1YIFJQUk9DIHN1cHBvcnQuCj4gPHNuaXA+Cj4gCj4+IC0t
LSBhL2RyaXZlcnMvcmVtb3RlcHJvYy9pbXhfcnByb2MuYwo+PiArKysgYi9kcml2ZXJzL3JlbW90
ZXByb2MvaW14X3Jwcm9jLmMKPiAKPiA8c25pcD4KPj4gIHN0YXRpYyBpbnQgaW14X3Jwcm9jX3Bh
cnNlX2Z3KHN0cnVjdCBycHJvYyAqcnByb2MsIGNvbnN0IHN0cnVjdCBmaXJtd2FyZSAqZncpCj4g
PHNuaXA+Cj4gCj4+IC0gICAgICAgICAgICAgICBwcml2LT5tZW1bYl0uY3B1X2FkZHIgPSBkZXZt
X2lvcmVtYXBfd2MoJnBkZXYtPmRldiwgcmVzLnN0YXJ0LCByZXNvdXJjZV9zaXplKCZyZXMpKTsK
Pj4gKyAgICAgICAgICAgICAgIHByaXYtPm1lbVtiXS5jcHVfYWRkciA9IGRldm1faW9yZW1hcF9y
ZXNvdXJjZV93YygmcGRldi0+ZGV2LCAmcmVzKTsKPiAKPiBkZXZtX2lvcmVtYXBfcmVzb3VyY2Vf
d2Mgd29ya3Mgb25seSBmb3IgSU9SRVNPVVJDRV9NRU0gcmVzb3VyY2VzOgo+IAo+IGxpYi9kZXZy
ZXMuYzoxMjQKPiBzdGF0aWMgdm9pZCBfX2lvbWVtICoKPiBfX2Rldm1faW9yZW1hcF9yZXNvdXJj
ZShzdHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0IHN0cnVjdCByZXNvdXJjZSAqcmVzLAo+IAo+IMK7
ICAgICAgIGlmICghcmVzIHx8IHJlc291cmNlX3R5cGUocmVzKSAhPSBJT1JFU09VUkNFX01FTSkg
ewo+IMK7ICAgICAgIMK7ICAgICAgIHJldCA9IGRldl9lcnJfcHJvYmUoZGV2LCAtRUlOVkFMLCAi
aW52YWxpZCByZXNvdXJjZQo+ICVwUlxuIiwgcmVzKTsKPiDCuyAgICAgICDCuyAgICAgICByZXR1
cm4gSU9NRU1fRVJSX1BUUihyZXQpOwo+IMK7ICAgICAgIH0KPiAKPiB3aGlsZSB0aGUgZGV2bV9p
b3JlbWFwX3djIGRvZXNuJ3QgY2FyZSBhYm91dCB0aGlzLgo+IApIaSBBbGwsCgo+IFNvIHdlIGNh
bm5vdCB1c2UgZGV2bV9pb3JlbWFwX3Jlc291cmNlX3djIGhlcmUgdW5sZXNzIHlvdSBhZGQKPiBJ
T1JFU09VUkNFX01FTSBmbGFncwo+IHRvICBvZl9yZXNlcnZlZF9tZW1fcmVnaW9uX3RvX3Jlc291
cmNlIGFzIGRpc2N1c3NlZCBoZXJlOgoKQWdyZWUgd2l0aCBEYW5pZWwsIElPUkVTT1VSQ0VfTUVN
IGZsYWdzIHNob3VsZCBiZSBzZXQgaW4gb2ZfcmVzZXJ2ZWRfbWVtX3JlZ2lvbl90b19yZXNvdXJj
ZSgpLgoKSSBnb3QgYSBzaW1pbGFyIGlzc3VlIHNpbmNlIGNvbW1pdCBkZWZlMDFhYmZiN2YgKCJz
cGk6IHN0bTMyLW9zcGk6IFVzZSBvZl9yZXNlcnZlZF9tZW1fcmVnaW9uX3RvX3Jlc291cmNlKCkg
Zm9yICJtZW1vcnktcmVnaW9uIikKcmVzb3VyY2UgZmxhZ3MgaXMgdW5zZXQsIHdoaWNoIGNhdXNp
bmcgdGhlIGZvbGxvd2luZyBlcnJvcjoKClsgICAxMS40NTUzODddIHN0bTMyLW9zcGkgNDA0MzAw
MDAuc3BpOiBlcnJvciAtRUlOVkFMOiBpbnZhbGlkIHJlc291cmNlIFs/Pz8gMHg2MDAwMDAwMC0w
eDZmZmZmZmZmIGZsYWdzIDB4MF0KClRoYW5rcwpQYXRyaWNlCj4gCj4gaHR0cHM6Ly9sa21sLm9y
Zy9sa21sLzIwMjUvNC8yOC83NTkKPiAKPiBUaGUgc2FtZSBpc3N1ZSB3ZSBhcmUgYWxyZWFkeSBl
eHBlcmllbmNpbmcgd2l0aCBTb3VuZCBPcGVuIEZpcm13YXJlCj4gd2hlcmUgdGhlIGNoYW5nZSB3
YXMgYWxyZWFkeSBtZXJnZWQKPiBhbmQgd2UgaGF2ZSBhIGJ1ZyBhbHJlYWR5IHJlcG9ydGVkLgo+
IAo+IEhvdyBzaG91bGQgd2UgZml4IHRoaXM6Cj4gCj4gMSkgQWRkICByZXMtPmZsYWdzID0gSU9S
RVNPVVJDRV9NRU07IGluICBvZl9yZXNlcnZlZF9tZW1fcmVnaW9uX3RvX3Jlc291cmNlCj4gCj4g
T1IKPiAKPiAyKSBVc2UgZGV2bV9pb3JlbWFwX3djIGluc3RlYWQgb2YgZGV2bV9pb3JlbWFwX3Jl
c291cmNlX3djLgo+IAo+IHRoYW5rcywKPiBEYW5pZWwuCj4gCj4gCj4gCj4gRGFuaWVsLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=

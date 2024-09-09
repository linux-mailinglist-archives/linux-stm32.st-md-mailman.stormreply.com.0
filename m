Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EB5970EBE
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Sep 2024 09:02:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 189FBC6DD66;
	Mon,  9 Sep 2024 07:02:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F04BCC6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Sep 2024 07:02:08 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 488NJcI3004295;
 Mon, 9 Sep 2024 09:01:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 e9ORReuSJ12+IscNIptFNf/Mkrft3JTYJ/7DOdslGQU=; b=7ymmRER43PNFeJqX
 XsPv/MQu+krLusDvyyjX/b26RXKmSiMW5EoZERbn1WpA9zltUTyDf/71SBJ0RMth
 ipNqez2cQigCb7QIYj/Y0lRXvHneEt4P4uqbiCilHf0ojTaDsM4sP/cTMSjA2OcL
 1f1TQ9Xn8Q0uopGOJFDJ3gTyGy+RjyAkV6PbuhMpcX1gkDd5XAuPvcsS3p77vMdM
 v5LA2N+nIIlCgZt8JZ7V8OCpS22BYwOobq85dquTjXny/1T/eYCp/j1qT+Dvwla3
 zyWtNhg5jz2p2iWGgUSk64Yk1Vl58q0bYHN6Kjh3y0XqF8w5o2cnCNnI1UQM0mQ8
 iLdq9Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41gy7s3rku-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Sep 2024 09:01:37 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A163D40044;
 Mon,  9 Sep 2024 09:00:16 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 60761246F19;
 Mon,  9 Sep 2024 08:57:58 +0200 (CEST)
Received: from [10.129.178.17] (10.129.178.17) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 9 Sep
 2024 08:57:57 +0200
Message-ID: <544a633e-de53-493d-9c29-de8ff52630da@foss.st.com>
Date: Mon, 9 Sep 2024 08:57:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Borislav Petkov <bp@alien8.de>, <linux-stm32@st-md-mailman.stormreply.com>
References: <20240905081902.GAZtlpdlQp5XOm5XtO@fat_crate.local>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20240905081902.GAZtlpdlQp5XOm5XtO@fat_crate.local>
X-Originating-IP: [10.129.178.17]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: dri-devel@lists.freedesktop.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] dw_mipi_dsi-stm.c:(.text+0x8db9a3): undefined
 reference to `clk_hw_unregister'
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

Ck9uIDkvNS8yNCAxMDoxOSwgQm9yaXNsYXYgUGV0a292IHdyb3RlOgo+IEhpIGFsbCwKPgo+IHRo
aXMgZmlyZXMgaW4gbXkgcmFuZGJ1aWxkcyBoZXJlOgo+Cj4gdm1saW51eC5vOiB3YXJuaW5nOiBv
Ymp0b29sOiBhZGlzMTY0MDBfd3JpdGVfcmF3KCkgZmFsbHMgdGhyb3VnaCB0byBuZXh0IGZ1bmN0
aW9uIGFkaXMxNjQwMF9zaG93X3NlcmlhbF9udW1iZXIoKQo+IGxkOiB2bWxpbnV4Lm86IGluIGZ1
bmN0aW9uIGBkd19taXBpX2RzaV9zdG1fcmVtb3ZlJzoKPiBkd19taXBpX2RzaS1zdG0uYzooLnRl
eHQrMHg4ZGI5YTMpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBjbGtfaHdfdW5yZWdpc3RlcicK
PiBsZDogdm1saW51eC5vOiBpbiBmdW5jdGlvbiBgZHdfbWlwaV9kc2lfY2xrX3JlZ2lzdGVyJzoK
PiBkd19taXBpX2RzaS1zdG0uYzooLnRleHQrMHg4ZGI5ZjUpOiB1bmRlZmluZWQgcmVmZXJlbmNl
IHRvIGBjbGtfaHdfcmVnaXN0ZXInCj4gbGQ6IHZtbGludXgubzogaW4gZnVuY3Rpb24gYGx2ZHNf
cmVtb3ZlJzoKPiBsdmRzLmM6KC50ZXh0KzB4OGRjNjA1KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0
byBgY2xrX2h3X3VucmVnaXN0ZXInCj4gbWFrZVsyXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLnZt
bGludXg6MzQ6IHZtbGludXhdIEVycm9yIDEKPiBtYWtlWzFdOiAqKiogWy9ob21lL2FtZC9icGV0
a292L2tlcm5lbC9saW51eC9NYWtlZmlsZToxMTU2OiB2bWxpbnV4XSBFcnJvciAyCj4gbWFrZTog
KioqIFtNYWtlZmlsZToyMjQ6IF9fc3ViLW1ha2VdIEVycm9yIDIKPgo+IGlzIHRoZXJlIGEgZml4
IHNvbWV3aGVyZT8KCkhpIEJvcmlzbGF2LAoKCkFybmQgQmVyZ21hbm4gc2VudCBhIHBhdGNoIHJl
Z2FyZGluZyB0aGlzIGlzc3VlIG9uIHg4NiB0aGF0IEkgbWVyZ2VkIHNldmVyYWwKd2Vla3MgYWdv
LgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDI0MDcxOTA3NTQ1NC4zNTk1MzU4LTEt
YXJuZEBrZXJuZWwub3JnLwpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvYzNkMDc1N2EtMDdj
MC00ZjgzLTlmMDYtYzNhZDIwNWFhMWU5QGZvc3Muc3QuY29tLwoKPgo+IFBlb3BsZSBsb3ZlIHRv
IGRvCj4KPiAJZGVwZW5kcyBvbiAuLi4gQ09NUElMRV9URVNUCj4KPiBidXQgdGhlbiBpZiBubyBv
bmUgdGFrZXMgY2FyZSBvZiBpdCBpbiB0aW1lOgo+Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
b2Uta2J1aWxkLWFsbC8yMDI0MDcyMTIwMDAucnBESDY0alAtbGtwQGludGVsLmNvbQoKTm93LCBJ
J20gbm90IGZhbWlsaWFyIHdpdGggUG93ZXJQQyBhcmNoaXRlY3R1cmUgYW5kIHRvb2xjaGFpbnMs
IGJ1dCBJIHRoaW5rIHRoaXMKcGF0Y2ggc2hvdWxkIGZpeCB5b3VyIHByb2JsZW0uCkRvIHlvdSBo
YXZlIHRoZSBhYm92ZSBmaXh1cCBpbiB5b3VyIHRyZWUgPyBJZiBub3QgcGxlYXNlIHRyeSBpdC4K
ClRoYW5rcywKClJlZ2FyZHMsClJhcGhhw6tsCgo+Cj4gdGhhdCBDT01QSUxFX1RFU1QgdGhpbmcg
aXMgZm9yY2luZyBtZSB0byBzaW1wbHkgYmxhY2tsaXN0IGl0IGFuZCBpcyBub3QgcmVhbGx5Cj4g
aGVscGluZy4KPgo+IFRoeC4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=

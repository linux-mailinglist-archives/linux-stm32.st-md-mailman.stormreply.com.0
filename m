Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB249736F2
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Sep 2024 14:16:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02E6FC6DD9E;
	Tue, 10 Sep 2024 12:16:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F12E8C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2024 12:16:18 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48A81HtJ011709;
 Tue, 10 Sep 2024 14:15:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 ioOMx4SZoDn6Y4I5z6mPsXYFUS0WP23smSQRZ2j69ro=; b=MIjHtFZft5ESF+0r
 WnHUXVLSZ+bXJzkMdpgXmCowdh5tFCDNW2D4gy5M/M5vtS9fTS4qif1h7shoVBsz
 t0kx9y9rIBfbYeTtl5yMDVUvac5S1TmwbA7fosczroQZm4286xfzc0UTkvypxVUh
 MNCxDHhoegcTsyH9jBiisDzpOk6ATt+Y5kagb/Gie/k//1jt/oTIoL6eP2KbvNDj
 sLsuGGRcrOrmnBFOJ8F0LINlONwnu4R3Wp9r6j0ESzNebYBT4oJR2ZWlv3OLS6VN
 q/1kLQ5klo8MPT65lvvhra1Bg7zlxkqYva6UbFSdxhNc7xd+kX9O1o2xMHCqLBd/
 sFQaAQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41gy7s9u01-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Sep 2024 14:15:58 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BE71A40045;
 Tue, 10 Sep 2024 14:14:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC59B2681BC;
 Tue, 10 Sep 2024 14:13:26 +0200 (CEST)
Received: from [10.252.24.111] (10.252.24.111) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 10 Sep
 2024 14:13:25 +0200
Message-ID: <2f5b8627-60c0-4528-83fb-25d5af324516@foss.st.com>
Date: Tue, 10 Sep 2024 14:13:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Maxime Ripard <mripard@kernel.org>
References: <20240905081902.GAZtlpdlQp5XOm5XtO@fat_crate.local>
 <544a633e-de53-493d-9c29-de8ff52630da@foss.st.com>
 <20240909084506.GBZt61kqqGVUTqjKc4@fat_crate.local>
 <0e9018d0-c49f-4dac-aa0f-b05504f9c6f6@foss.st.com>
 <20240910-gleaming-boa-of-drama-d0a4db@houat>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20240910-gleaming-boa-of-drama-d0a4db@houat>
X-Originating-IP: [10.252.24.111]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
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

Ck9uIDkvMTAvMjQgMTM6NTksIE1heGltZSBSaXBhcmQgd3JvdGU6Cj4gT24gVHVlLCBTZXAgMTAs
IDIwMjQgYXQgMTI6NDg6NDlQTSBHTVQsIFJhcGhhZWwgR2FsbGFpcy1Qb3Ugd3JvdGU6Cj4+IE9u
IDkvOS8yNCAxMDo0NSwgQm9yaXNsYXYgUGV0a292IHdyb3RlOgo+Pj4gT24gTW9uLCBTZXAgMDks
IDIwMjQgYXQgMDg6NTc6NTdBTSArMDIwMCwgUmFwaGFlbCBHYWxsYWlzLVBvdSB3cm90ZToKPj4+
PiBBcm5kIEJlcmdtYW5uIHNlbnQgYSBwYXRjaCByZWdhcmRpbmcgdGhpcyBpc3N1ZSBvbiB4ODYg
dGhhdCBJIG1lcmdlZCBzZXZlcmFsCj4+Pj4gd2Vla3MgYWdvLgo+Pj4+Cj4+Pj4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGttbC8yMDI0MDcxOTA3NTQ1NC4zNTk1MzU4LTEtYXJuZEBrZXJuZWwu
b3JnLwo+Pj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9jM2QwNzU3YS0wN2MwLTRmODMt
OWYwNi1jM2FkMjA1YWExZTlAZm9zcy5zdC5jb20vCj4+PiBUaGFua3MuCj4+Pgo+Pj4+IE5vdywg
SSdtIG5vdCBmYW1pbGlhciB3aXRoIFBvd2VyUEMgYXJjaGl0ZWN0dXJlIGFuZCB0b29sY2hhaW5z
LCBidXQgSSB0aGluawo+Pj4+IHRoaXMgcGF0Y2ggc2hvdWxkIGZpeCB5b3VyIHByb2JsZW0uICBE
byB5b3UgaGF2ZSB0aGUgYWJvdmUgZml4dXAgaW4geW91cgo+Pj4+IHRyZWUgPyBJZiBub3QgcGxl
YXNlIHRyeSBpdC4KPj4+IE5vdCBQb3dlclBDIC0gaXQgaXMgYW4geDg2IGJ1aWxkLiBJIGRvIHJh
bmRvbSBjb25maWcgYnVpbGRzIGFzIHBhcnQgb2YgYnVpbGQKPj4+IHRlc3RpbmcgYW5kIHdoZW4g
YSBkcml2ZXIgZGVwZW5kcyBvbiBDT01QSUxFX1RFU1QsIGl0IGRvZXMgZ2V0cyBidWlsdCBpbiBz
b21lCj4+PiAuY29uZmlncy4gU28gc29tZSBtYXkgZmFpbCwgYXMgaW4gdGhpcyBjYXNlLgo+PiBV
bmxlc3MgSSBhbSBtaXN0YWtlbiwgdGhlIGxpbmsgeW91IHByb3ZpZGVkIHJlZmVycyB0byBhIFBv
d2VyUEMgbGlua2VyIGVycm9yOgo+Pgo+PiBbLi4uXQo+Pgo+PiBjb21waWxlcjogcG93ZXJwYy1s
aW51eC1nY2MgKEdDQykgMTQuMS4wCj4+Cj4+IFsuLi5dCj4+ICAgIHBvd2VycGMtbGludXgtbGQ6
IGRyaXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlwaV9kc2ktc3RtLm86IGluIGZ1bmN0aW9uIGBkd19t
aXBpX2RzaV9zdG1fcmVtb3ZlJzoKPj4gICAgZHdfbWlwaV9kc2ktc3RtLmM6KC50ZXh0KzB4NjY0
KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgb2ZfY2xrX2RlbF9wcm92aWRlcicKPj4+PiBwb3dl
cnBjLWxpbnV4LWxkOiBkd19taXBpX2RzaS1zdG0uYzooLnRleHQrMHg2NmMpOiB1bmRlZmluZWQg
cmVmZXJlbmNlIHRvIGBjbGtfaHdfdW5yZWdpc3RlcicgICAgcG93ZXJwYy1saW51eC1sZDogZHJp
dmVycy9ncHUvZHJtL3N0bS9kd19taXBpX2RzaS1zdG0ubzogaW4gZnVuY3Rpb24gYGR3X21pcGlf
ZHNpX3N0bV9wcm9iZSc6Cj4+ICAgIGR3X21pcGlfZHNpLXN0bS5jOigudGV4dCsweDk4Yyk6IHVu
ZGVmaW5lZCByZWZlcmVuY2UgdG8gYGNsa19od19yZWdpc3RlcicKPj4KPj4+IFNvIEkgdGhpbmsg
eW91IHNob3VsZCBzZW5kIHRoYXQgcGF0Y2ggdG8gTGludXMgbm93IHNvIHRoYXQgc3VjaCByYW5k
Y29uZmlnCj4+PiBidWlsZHMgZG8gbm90IGZhaWwgYW55bW9yZS4KPj4gV2hhdCBkbyB5b3UgbWVh
biBieSAnc2VuZGluZyBpdCB0byBMaW51cycgPyBJZiB5b3UgbWVhbnQgdG8gZG8gYSBwdWxsIHJl
cXVlc3QsCj4+IHRoZW4gbm8uIFRoaXMgcGF0Y2ggaXMgYWxyZWFkeSBpbiB0aGUgZHJtLW1pc2Mg
dHJlZSwgd2hpY2ggbWVhbnMgaXQgd2lsbCBrZWVwCj4+IGl0cyB1c3VhbCBwYWNlIG9mIG1lcmdp
bmcgd2l0aCB0aGUgcmVzdCBvZiB0aGUgZHJtLW1pc2MgdHJlZS4KPj4KPj4gRm9yIG1vcmUgaW5m
b3JtYXRpb24gYWJvdXQgZHJtLW1pc2MgdHJlZToKPj4gaHR0cHM6Ly9kcm0ucGFnZXMuZnJlZWRl
c2t0b3Aub3JnL21haW50YWluZXItdG9vbHMvcmVwb3NpdG9yaWVzL2RybS1taXNjLmh0bWwjbWVy
Z2UtdGltZWxpbmUKPiBUaGF0J3Mgbm90IGVudGlyZWx5IGNvcnJlY3QuIFRoaXMgc2hvdWxkIGhh
dmUgYmVlbiBtZXJnZWQgaW4KPiBkcm0tbWlzYy1maXhlcyB0byBiZWdpbiB3aXRoLiBJJ3ZlIGNo
ZXJyeS1waWNrZWQgdGhlIHBhdGNoIGFuZCBwdXNoZWQKPiBpdC4KCkhpIE1heGltZSwKCk9vcHMg
SSBzdGFuZCBjb3JyZWN0ZWQsIEkgZWZmZWN0aXZlbHkgc2hvdWxkIGhhdmUgdGhvdWdodCBhYm91
dCBzZW5kaW5nIHRoaXMgdG8KZHJtLW1pc2MtZml4ZXMuClRoYW5rIHlvdSBmb3IgZG9pbmcgdGhp
cy4KClJlZ2FyZHMsCgpSYXBoYcOrbAoKPgo+IE1heGltZQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=

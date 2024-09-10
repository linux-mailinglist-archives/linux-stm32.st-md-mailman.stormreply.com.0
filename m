Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1089797358F
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Sep 2024 12:52:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B57BAC71290;
	Tue, 10 Sep 2024 10:52:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D26BC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2024 10:52:25 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48A7dsqE017268;
 Tue, 10 Sep 2024 12:51:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 GTXIqttQsTFPl8RhA+OuEhkVjdhqa/BUezdHeMsd0Wg=; b=GdbIfRJPuU8F36gC
 WGXi8Xtn39pr/LMPeX7E6Ge5LKWfgz6967HXE86UFD5HPiKUase7aUfuViEyK63V
 URMFwQ5iLjSxL65ebj+ZUeVHTjeLxJe3Cn1oRJ1GD9LDeY4NS0Q3inWSL/jn3OZA
 MduPLVb20pTW6bn062RasuZG9WDJT19dN6/WZ5OWihAUxTxqzz4tO4sZKaLXTuk+
 sbNmQBHB1Emzcsc5Qa51KSUZ0VMZooa0WHwQgS3z+1p87pKPCs5NOHjB4vr/k2cA
 vNJTMQT1rQ4uhA+YcOHZKiMe5/7zkmA29idhQK/m/TjcoXgE6Saw3emsTbT6uZ4K
 87DIwA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41gy7s9g89-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Sep 2024 12:51:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0E8E440047;
 Tue, 10 Sep 2024 12:50:32 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 194A7260266;
 Tue, 10 Sep 2024 12:48:50 +0200 (CEST)
Received: from [10.129.178.17] (10.129.178.17) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 10 Sep
 2024 12:48:49 +0200
Message-ID: <0e9018d0-c49f-4dac-aa0f-b05504f9c6f6@foss.st.com>
Date: Tue, 10 Sep 2024 12:48:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Borislav Petkov <bp@alien8.de>
References: <20240905081902.GAZtlpdlQp5XOm5XtO@fat_crate.local>
 <544a633e-de53-493d-9c29-de8ff52630da@foss.st.com>
 <20240909084506.GBZt61kqqGVUTqjKc4@fat_crate.local>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20240909084506.GBZt61kqqGVUTqjKc4@fat_crate.local>
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
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

Ck9uIDkvOS8yNCAxMDo0NSwgQm9yaXNsYXYgUGV0a292IHdyb3RlOgo+IE9uIE1vbiwgU2VwIDA5
LCAyMDI0IGF0IDA4OjU3OjU3QU0gKzAyMDAsIFJhcGhhZWwgR2FsbGFpcy1Qb3Ugd3JvdGU6Cj4+
IEFybmQgQmVyZ21hbm4gc2VudCBhIHBhdGNoIHJlZ2FyZGluZyB0aGlzIGlzc3VlIG9uIHg4NiB0
aGF0IEkgbWVyZ2VkIHNldmVyYWwKPj4gd2Vla3MgYWdvLgo+Pgo+PiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9sa21sLzIwMjQwNzE5MDc1NDU0LjM1OTUzNTgtMS1hcm5kQGtlcm5lbC5vcmcvCj4+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9jM2QwNzU3YS0wN2MwLTRmODMtOWYwNi1jM2Fk
MjA1YWExZTlAZm9zcy5zdC5jb20vCj4gVGhhbmtzLgo+Cj4+IE5vdywgSSdtIG5vdCBmYW1pbGlh
ciB3aXRoIFBvd2VyUEMgYXJjaGl0ZWN0dXJlIGFuZCB0b29sY2hhaW5zLCBidXQgSSB0aGluawo+
PiB0aGlzIHBhdGNoIHNob3VsZCBmaXggeW91ciBwcm9ibGVtLiAgRG8geW91IGhhdmUgdGhlIGFi
b3ZlIGZpeHVwIGluIHlvdXIKPj4gdHJlZSA/IElmIG5vdCBwbGVhc2UgdHJ5IGl0Lgo+IE5vdCBQ
b3dlclBDIC0gaXQgaXMgYW4geDg2IGJ1aWxkLiBJIGRvIHJhbmRvbSBjb25maWcgYnVpbGRzIGFz
IHBhcnQgb2YgYnVpbGQKPiB0ZXN0aW5nIGFuZCB3aGVuIGEgZHJpdmVyIGRlcGVuZHMgb24gQ09N
UElMRV9URVNULCBpdCBkb2VzIGdldHMgYnVpbHQgaW4gc29tZQo+IC5jb25maWdzLiBTbyBzb21l
IG1heSBmYWlsLCBhcyBpbiB0aGlzIGNhc2UuCgpVbmxlc3MgSSBhbSBtaXN0YWtlbiwgdGhlIGxp
bmsgeW91IHByb3ZpZGVkIHJlZmVycyB0byBhIFBvd2VyUEMgbGlua2VyIGVycm9yOgoKWy4uLl0K
CmNvbXBpbGVyOiBwb3dlcnBjLWxpbnV4LWdjYyAoR0NDKSAxNC4xLjAKClsuLi5dCiAgIHBvd2Vy
cGMtbGludXgtbGQ6IGRyaXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlwaV9kc2ktc3RtLm86IGluIGZ1
bmN0aW9uIGBkd19taXBpX2RzaV9zdG1fcmVtb3ZlJzoKICAgZHdfbWlwaV9kc2ktc3RtLmM6KC50
ZXh0KzB4NjY0KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgb2ZfY2xrX2RlbF9wcm92aWRlcicK
Pj4gcG93ZXJwYy1saW51eC1sZDogZHdfbWlwaV9kc2ktc3RtLmM6KC50ZXh0KzB4NjZjKTogdW5k
ZWZpbmVkIHJlZmVyZW5jZSB0byBgY2xrX2h3X3VucmVnaXN0ZXInICAgIHBvd2VycGMtbGludXgt
bGQ6IGRyaXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlwaV9kc2ktc3RtLm86IGluIGZ1bmN0aW9uIGBk
d19taXBpX2RzaV9zdG1fcHJvYmUnOgogICBkd19taXBpX2RzaS1zdG0uYzooLnRleHQrMHg5OGMp
OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBjbGtfaHdfcmVnaXN0ZXInCgo+Cj4gU28gSSB0aGlu
ayB5b3Ugc2hvdWxkIHNlbmQgdGhhdCBwYXRjaCB0byBMaW51cyBub3cgc28gdGhhdCBzdWNoIHJh
bmRjb25maWcKPiBidWlsZHMgZG8gbm90IGZhaWwgYW55bW9yZS4KCldoYXQgZG8geW91IG1lYW4g
YnkgJ3NlbmRpbmcgaXQgdG8gTGludXMnID8gSWYgeW91IG1lYW50IHRvIGRvIGEgcHVsbCByZXF1
ZXN0LAp0aGVuIG5vLiBUaGlzIHBhdGNoIGlzIGFscmVhZHkgaW4gdGhlIGRybS1taXNjIHRyZWUs
IHdoaWNoIG1lYW5zIGl0IHdpbGwga2VlcAppdHMgdXN1YWwgcGFjZSBvZiBtZXJnaW5nIHdpdGgg
dGhlIHJlc3Qgb2YgdGhlIGRybS1taXNjIHRyZWUuCgpGb3IgbW9yZSBpbmZvcm1hdGlvbiBhYm91
dCBkcm0tbWlzYyB0cmVlOgpodHRwczovL2RybS5wYWdlcy5mcmVlZGVza3RvcC5vcmcvbWFpbnRh
aW5lci10b29scy9yZXBvc2l0b3JpZXMvZHJtLW1pc2MuaHRtbCNtZXJnZS10aW1lbGluZQoKPgo+
IFVuZm9ydHVuYXRlbHksIEkgY2Fubm90IHRlc3QgaXQgcmlnaHQgbm93IGJlY2F1c2UgSSd2ZSBy
ZW1vdmVkIHRoZSB0cmlnZ2VyaW5nCj4gcmFuZGNvbmZpZ3MgYnV0IHdoZW4gSSBoaXQgaXQgYWdh
aW4sIEknbGwgbWFrZSBzdXJlIHRvIGFwcGx5IHlvdXJzLgpUaGFuayB5b3UgZm9yIHRoaXMuIERv
IG5vdCBoZXNpdGF0ZSB0byByZWFjaCBpZiB5b3UgZW5jb3VudGVyIGFueSBwcm9ibGVtcyB3aXRo
CnRoaXMgcGF0Y2guCgpSZWdhcmRzLApSYXBoYcOrbAoKPgo+IFRoeC4KPgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=

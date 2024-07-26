Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3491193CF22
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jul 2024 09:57:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADD27C78018;
	Fri, 26 Jul 2024 07:57:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09210C78015
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jul 2024 07:56:59 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46Q17Z4a014966;
 Fri, 26 Jul 2024 09:56:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Brr04Pe1fkXs9tsSusvMFJGsR4bSgiu85SIGyKI1YuE=; b=Ev68stnTu+1elg9J
 seY2LFurY4iEQ4jYFF2CCCPEYt2Excg5ZNYd+5polc8o83Iof9i+SZdooch5pBLl
 Z38on+noiBUqi+xXNMyGh125eZTyF7ZeUz7LEskMcp6Xqm5fsItNmJnyh5Z9W00d
 hE6hnK6c2692wvcVrMuuwdSHx5QFNy9UwsaaXXo37uovHW1vCGsDapr3MzamNM2u
 xqN/qMKPDvOhb1T4RM/Eg0wXQFzSs1urfv67mvPYT0xkMEs9/6hnlDy0oCpPaZKa
 pEeEn1d4hlDop3mCx6F9hWPyb0WHV+4yAD9k4BhfCPU581IRzC2fg1kVp/UHLg+V
 MMoWEA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 40m1s118nv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jul 2024 09:56:33 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F3F0940045;
 Fri, 26 Jul 2024 09:56:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4704E2375D3;
 Fri, 26 Jul 2024 09:55:41 +0200 (CEST)
Received: from [10.252.18.134] (10.252.18.134) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 26 Jul
 2024 09:55:40 +0200
Message-ID: <e059f157-ff9c-32cb-57a6-48f2331f2555@foss.st.com>
Date: Fri, 26 Jul 2024 09:55:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Yanjun Yang <yangyj.ee@gmail.com>
References: <20240129104106.43141-1-raphael.gallais-pou@foss.st.com>
 <21f4d43d-4abd-4aca-7abb-7321bcfa0f1d@foss.st.com>
 <CAE8JAfy9NtBa--DnUt2AEZPFnvjU6idj8DqUbaeLaH0DMFvuhw@mail.gmail.com>
Content-Language: en-US
From: Philippe CORNU <philippe.cornu@foss.st.com>
In-Reply-To: <CAE8JAfy9NtBa--DnUt2AEZPFnvjU6idj8DqUbaeLaH0DMFvuhw@mail.gmail.com>
X-Originating-IP: [10.252.18.134]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-26_05,2024-07-25_03,2024-05-17_01
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RESEND v3 0/3] Update STM DSI PHY driver
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

CgpPbiA3LzIyLzI0IDEwOjM4LCBZYW5qdW4gWWFuZyB3cm90ZToKPiBPbiBGcmksIEp1biAyOCwg
MjAyNCBhdCA4OjQ34oCvUE0gUGhpbGlwcGUgQ09STlUKPiA8cGhpbGlwcGUuY29ybnVAZm9zcy5z
dC5jb20+IHdyb3RlOgo+Pgo+Pgo+Pgo+PiBPbiAxLzI5LzI0IDExOjQxLCBSYXBoYWVsIEdhbGxh
aXMtUG91IHdyb3RlOgo+Pj4KPj4+IFRoaXMgcGF0Y2ggc2VyaWVzIGFpbXMgdG8gYWRkIHNldmVy
YWwgZmVhdHVyZXMgb2YgdGhlIGR3LW1pcGktZHNpIHBoeQo+Pj4gZHJpdmVyIHRoYXQgYXJlIG1p
c3Npbmcgb3IgbmVlZCB0byBiZSB1cGRhdGVkLgo+Pj4KPj4+IEZpcnN0IHBhdGNoIHVwZGF0ZSBh
IFBNIG1hY3JvLgo+Pj4KPj4+IFNlY29uZCBwYXRjaCBhZGRzIHJ1bnRpbWUgUE0gZnVuY3Rpb25h
bGl0eSB0byB0aGUgZHJpdmVyLgo+Pj4KPj4+IFRoaXJkIHBhdGNoIGFkZHMgYSBjbG9jayBwcm92
aWRlciBnZW5lcmF0ZWQgYnkgdGhlIFBIWSBpdHNlbGYuICBBcwo+Pj4gZXhwbGFpbmVkIGluIHRo
ZSBjb21taXQgbG9nIG9mIHRoZSBzZWNvbmQgcGF0Y2gsIGEgY2xvY2sgZGVjbGFyYXRpb24gaXMK
Pj4+IG1pc3NpbmcuICBTaW5jZSB0aGlzIGNsb2NrIGlzIHBhcmVudCBvZiAnZHNpX2snLCBpdCBs
ZWFkcyB0byBhbiBvcnBoYW4KPj4+IGNsb2NrLiAgTW9zdCBpbXBvcnRhbnRseSB0aGlzIHBhdGNo
IGlzIGFuIGFudGljaXBhdGlvbiBmb3IgZnV0dXJlCj4+PiB2ZXJzaW9ucyBvZiB0aGUgRFNJIFBI
WSwgYW5kIGl0cyBpbmNsdXNpb24gd2l0aGluIHRoZSBkaXNwbGF5IHN1YnN5c3RlbQo+Pj4gYW5k
IHRoZSBEUk0gZnJhbWV3b3JrLgo+Pj4KPj4+IExhc3QgcGF0Y2ggZml4ZXMgYSBjb3JuZXIgZWZm
ZWN0IGludHJvZHVjZWQgcHJldmlvdXNseS4gIFNpbmNlICdkc2knIGFuZAo+Pj4gJ2RzaV9rJyBh
cmUgZ2F0ZWQgYnkgdGhlIHNhbWUgYml0IG9uIHRoZSBzYW1lIHJlZ2lzdGVyLCBib3RoIHJlZmVy
ZW5jZQo+Pj4gd29yayBhcyBwZXJpcGhlcmFsIGNsb2NrIGluIHRoZSBkZXZpY2UtdHJlZS4KPj4+
Cj4gCj4gVGhpcyBwYXRjaCAoY29tbWl0IGlkOjE4NWY5OWI2MTQ0MjczNjApIHNlZW1zIHRvIGJy
ZWFrIHRoZSBkc2kgb2YKPiBzdG0zMmY0NjkgY2hpcC4KPiBJJ20gbm90IGZhbWlsaWFyIHdpdGgg
dGhlIGRybSBhbmQgdGhlIGNsb2NrIGZyYW1ld29yaywgbWF5YmUgaXQncwo+IGJlY2F1c2UgdGhl
cmUgaXMgbm8KPiAgICJja19kc2lfcGh5IiBkZWZpbmVkIGZvciBzdG0zMmY0NjkuCj4gUFM6ICBT
b3JyeSBmb3IgcmVjZWl2aW5nIG11bHRpcGxlIGNvcGllcyBvZiB0aGlzIGVtYWlsLCBJIGZvcmdv
dCB0bwo+IHVzZSBwbGFpbiB0ZXh0IG1vZGUgbGFzdCB0aW1lLgo+IAoKSGksClRoYW5rIHlvdSBm
b3IgbGV0dGluZyB1cyBrbm93IHRoYXQgdGhlcmUgd2FzIHRoaXMgZXJyb3IuIFdlIHNob3VsZCBo
YXZlIApkZXRlY3RlZCB0aGlzIGJlZm9yZSBtZXJnaW5nLCByZWFsbHkgc29ycnkgZm9yIHRoZSBw
cm9ibGVtcyBjYXVzZWQgYnkgCnRoaXMgcGF0Y2guIFdlIHdpbGwgaW52ZXN0aWdhdGUgdGhlIGlz
c3VlIGFuZCBnZXQgYmFjayB0byB5b3UgYXMgc29vbiBhcyAKcG9zc2libGUuIEluIHRoZSBtZWFu
dGltZSwgSSB0aGluayB5b3UgY2FuIHJldmVydCB0aGlzIHBhdGNoIGluIHlvdXIgZ2l0IAp0cmVl
LgoKUGhpbGlwcGUgOi0pCgo+Pj4gLS0tCj4+PiBDaGFuZ2VzIGluIHYzLXJlc2VuZDoKPj4+ICAg
ICAgICAtIFJlbW92ZWQgbGFzdCBwYXRjaCBhcyBpdCBoYXMgYmVlbiBtZXJnZWQKPj4+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvYmY0OWY0YzktOWU4MS00YzkxLTk3MmQtMTM3ODJkOTk2
YWFhQGZvc3Muc3QuY29tLwo+Pj4KPj4+IENoYW5nZXMgaW4gdjM6Cj4+PiAgICAgICAgLSBGaXgg
c21hdGNoIHdhcm5pbmcgKGRpc2FibGUgZHNpLT5wY2xrIHdoZW4gY2xrX3JlZ2lzdGVyIGZhaWxz
KQo+Pj4KPj4+IENoYW5nZXMgaW4gdjI6Cj4+PiAgICAgICAgLSBBZGRlZCBwYXRjaCAxLzQgdG8g
dXNlIFNZU1RFTV9TTEVFUF9QTV9PUFMgaW5zdGVhZCBvZiBvbGQgbWFjcm8KPj4+ICAgICAgICAg
IGFuZCByZW1vdmVkIF9fbWF5YmVfdXNlZCBmb3IgYWNjb3JkaW5nbHkKPj4+ICAgICAgICAtIENo
YW5nZWQgU0VUX1JVTlRJTUVfUE1fT1BTIHRvIFJVTlRJTUVfUE1fT1BTCj4+Pgo+Pj4gUmFwaGFl
bCBHYWxsYWlzLVBvdSAoMyk6Cj4+PiAgICAgZHJtL3N0bTogZHNpOiB1c2UgbmV3IFNZU1RFTV9T
TEVFUF9QTV9PUFMoKSBtYWNybwo+Pj4gICAgIGRybS9zdG06IGRzaTogZXhwb3NlIERTSSBQSFkg
aW50ZXJuYWwgY2xvY2sKPj4+Cj4+PiBZYW5uaWNrIEZlcnRyZSAoMSk6Cj4+PiAgICAgZHJtL3N0
bTogZHNpOiBhZGQgcG0gcnVudGltZSBvcHMKPj4+Cj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vc3Rt
L2R3X21pcGlfZHNpLXN0bS5jIHwgMjc5ICsrKysrKysrKysrKysrKysrKysrKystLS0tCj4+PiAg
ICAxIGZpbGUgY2hhbmdlZCwgMjM4IGluc2VydGlvbnMoKyksIDQxIGRlbGV0aW9ucygtKQo+Pj4K
Pj4KPj4gSGkgUmFwaGHDq2wgJiBZYW5uaWNrLAo+PiBBcHBsaWVkIG9uIGRybS1taXNjLW5leHQu
Cj4+IE1hbnkgdGhhbmtzLAo+PiBQaGlsaXBwZSA6LSkKPj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Cj4+
IExpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KPj4gaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK

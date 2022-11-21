Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD3A631BD6
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Nov 2022 09:49:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1360BC65065;
	Mon, 21 Nov 2022 08:49:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E678C6504A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 08:49:05 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AL6P494022120; Mon, 21 Nov 2022 09:48:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=YN687U0kxELSCHXgysLfYlUDondN7TTlf1RFw+IfXPI=;
 b=QxieuqCz19jVxKrtPIJIwIMSIb6rtxG0/lssSSYcs+XcDYAdj0IFvDrm9GmCNednIdaj
 u4UnDhJsETw2RNIJqKMTF6ySSj+Ow0eWfPOYdKmGZqeeUQCs1aeoP/93VFQ2yXSuAtFR
 6Wvopp+g6LSorzmxCWN0rC+VrHB9ov09ksxzjKNd0GTTvDBiEiqz0R7uQfyFaXKbUV8M
 r1rmj0aGq/bmmXFjQasstpPBDynrHqAUxGiWNmFU6elnqEd+Bl+jMYlpU+sGdYEV2tN4
 sxgfX6pdA+jXa2+9uI+WTG8yPtwn7aZ/CkGBV21XEXRu6W4zPBYWMZ9TBVePWn+zVAxu Iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kxrcgrwgt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Nov 2022 09:48:41 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0D27810003A;
 Mon, 21 Nov 2022 09:48:34 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F3C5821515A;
 Mon, 21 Nov 2022 09:48:33 +0100 (CET)
Received: from [10.201.20.168] (10.201.20.168) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Mon, 21 Nov
 2022 09:48:33 +0100
Message-ID: <7a4b85f9-8d23-57de-c09d-d586bf63fb3f@foss.st.com>
Date: Mon, 21 Nov 2022 09:48:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Amelie Delaunay <amelie.delaunay@foss.st.com>, Marek Vasut <marex@denx.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Erwan LE RAY <erwan.leray@foss.st.com>
References: <20220203171114.10888-1-erwan.leray@foss.st.com>
 <cc7633c5-de5f-0abf-4ac8-64a74633dfcc@pengutronix.de>
 <f5aec360-c33c-0145-6596-541003e305b2@foss.st.com>
 <98823363-710c-6286-8e63-ba8e5dcadeba@foss.st.com>
 <20221108115916.hlmbvyrnmkxymeed@pengutronix.de>
 <230c26ea-f7c5-2688-16fd-e4a91f421833@denx.de>
 <28c5e508-6893-8ca3-88cc-487a98871722@foss.st.com>
From: Valentin CARON <valentin.caron@foss.st.com>
In-Reply-To: <28c5e508-6893-8ca3-88cc-487a98871722@foss.st.com>
X-Originating-IP: [10.201.20.168]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-21_05,2022-11-18_01,2022-06-22_01
Cc: devicetree@vger.kernel.org, Amelie DELAUNAY <amelie.delaunay@st.com>,
 Pengutronix
 Kernel Team <kernel@pengutronix.de>, linux-kernel@vger.kernel.org,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 00/16] STM32 configure UART nodes for DMA
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

SGkgVXdlLAoKV2UgZm91bmQgdGhlIGlzc3VlLCB0aGFuayB5b3UgdG8gaGF2ZSByZXBvcnRlZCBp
dC4KCnN0bTMyLXVzYXJ0IGRyaXZlciB3YXMgbm90IHRvbGVyYW50IHRvIGEgcHJvYmUgZGVmZXIg
ZnJvbSBETUEgd2hlbiB0aGUgCmVhcmx5Y29uIGlzIGFjdGl2ZS4KCllvdSBjYW4gZmluZCB0aGUg
cGF0Y2ggaGVyZToKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIyMTExODE3MDYwMi4x
MDU3ODYzLTEtdmFsZW50aW4uY2Fyb25AZm9zcy5zdC5jb20vCgpWYWxlbnRpbgoKT24gMTEvOS8y
MiAxNDo0OCwgQW1lbGllIERlbGF1bmF5IHdyb3RlOgo+IE9uIDExLzgvMjIgMTY6MjgsIE1hcmVr
IFZhc3V0IHdyb3RlOgo+PiBPbiAxMS84LzIyIDEyOjU5LCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90
ZToKPj4+IE9uIEZyaSwgRmViIDA0LCAyMDIyIGF0IDA0OjQxOjU1UE0gKzAxMDAsIEVyd2FuIExF
IFJBWSB3cm90ZToKPj4+PiBPbiAyLzQvMjIgMjoyMiBQTSwgQWxleGFuZHJlIFRPUkdVRSB3cm90
ZToKPj4+Pj4gSGkgQWhtYWQKPj4+Pj4KPj4+Pj4gT24gMi8zLzIyIDE4OjI1LCBBaG1hZCBGYXRv
dW0gd3JvdGU6Cj4+Pj4+PiBIZWxsbyBFcndhbiwKPj4+Pj4+Cj4+Pj4+PiBPbiAwMy4wMi4yMiAx
ODoxMCwgRXJ3YW4gTGUgUmF5IHdyb3RlOgo+Pj4+Pj4+IEFkZCBETUEgY29uZmlndXJhdGlvbiB0
byBVQVJUIG5vZGVzIGluIHN0bTMybXAxNXggKFNPQyBsZXZlbCkgYW5kCj4+Pj4+Pj4gcmVtb3Zl
IGl0IGF0IGJvYXJkIGxldmVsIHRvIGtlZXAgY3VycmVudCBQSU8gYmVoYXZpb3Igd2hlbiBuZWVk
ZWQuCj4+Pj4+Pj4gRm9yIHN0bTMyLWVkMSBhbmQgc3RtMzItZGt4IGJvYXJkcywgVUFSVDQgKGNv
bnNvbGUpIGFuZCBVQVJUNwo+Pj4+Pj4+IChubyBIVyBmbG93IGNvbnRyb2wgcGluIGF2YWlsYWJs
ZSkgYXJlIGtlcHQgaW4gUElPIG1vZGUsIHdoaWxlIAo+Pj4+Pj4+IFVTQVJUMwo+Pj4+Pj4+IGlz
IG5vdyBjb25maWd1cmVkIGluIERNQSBtb2RlLgo+Pj4+Pj4+IFVBUlQ0IChjb25zb2xlIFVBUlQp
IGhhcyB0byBiZSBrZXB0IGluIGlycSBtb2RlLCBhcyBETUEgc3VwcG9ydCBmb3IKPj4+Pj4+PiBj
b25zb2xlIGhhcyBiZWVuIHJlbW92ZWQgZnJvbSB0aGUgZHJpdmVyIGJ5IGNvbW1pdCBlMzU5YjQ0
MTFjMjgKPj4+Pj4+PiAoInNlcmlhbDogc3RtMzI6IGZpeCB0aHJlYWRlZCBpbnRlcnJ1cHQgaGFu
ZGxpbmciKS4KPj4+Pj4+Cj4+Pj4+PiBEbyBJIHVuZGVyc3RhbmQgY29ycmVjdGx5IHRoYXQgeW91
ciBmaXJzdCBwYXRjaCBicmVha3MgY29uc29sZXMgb2YKPj4+Pj4+IG1vc3QvYWxsIGJvYXJkcywg
YmVjYXVzZSB0aGV5IHdpbGwgYnJpZWZseSB1c2UgRE1BLCB3aGljaCBpcyByZWZ1c2VkCj4+Pj4+
PiBieSB0aGUgc3RtMzItdXNhcnQgZHJpdmVyIGFuZCB0aGVuIHlvdSBhZGQgYSBwYXRjaCBmb3Ig
ZWFjaCBib2FyZAo+Pj4+Pj4gdG8gZml4IHRoYXQgYnJlYWthZ2U/Cj4+Pj4+Cj4+Pj4+IFdlIGhh
dmUgdHdvIHNvbHV0aW9ucyBhbmQgYm90aCBoYXZlIHByby9kcmF3YmFja3MuIFRoZSBmaXJzdCBv
bmUgCj4+Pj4+IChFcndhbgo+Pj4+PiBvbmVzLCBjYW4gYnJlYWsgdGhlIGJvb3QgaWYgdGhlIHBh
dGNoIGlzIHRha2VuICJhbG9uZSIuIFlvdXIgCj4+Pj4+IHByb3Bvc2l0aW9uCj4+Pj4+IGF2b2lk
cyB0aGlzIGJyZWFrYWdlIGJ1dCBkZWxldGVzIGEgbm9uIGRlZmluZSBwcm9wZXJ0eSAod2hpY2gg
aXMgYSAKPj4+Pj4gYml0Cj4+Pj4+IHdlaXJkKS4gSG93ZXZlciBJIHByZWZlciB0byBrZWVwIGEg
ZnVuY3Rpb25hbCBiZWhhdmlvciwgYW5kIGtlZXAgCj4+Pj4+IEFobWFkCj4+Pj4+IHByb3Bvc2l0
aW9uLiBBaG1hZCwganVzdCBvbmUgcXVlc3Rpb24sIGR0LWJpbmRpbmdzIGNoZWNrIGRvZXNuJ3QK
Pj4+Pj4gY29tcGxhaW4gYWJvdXQgaXQgPwo+Pj4+Pgo+Pj4+PiBDaGVlcnMKPj4+Pj4gQWxleAo+
Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IFN1Y2ggaW50ZXJtaXR0ZW50IGJyZWFrYWdlIG1ha2VzIGJpc2Vj
dGlvbiBhIGhhc3NsZS4gCj4+Pj4+PiAvZGVsZXRlLXByb3BlcnR5Lwo+Pj4+Pj4gaXMgYSBuby1v
cCB3aGVuIHRoZSBwcm9wZXJ0eSBkb2Vzbid0IGV4aXN0LCBzbyB5b3UgY291bGQgbW92ZSB0aGUg
Cj4+Pj4+PiBmaXJzdAo+Pj4+Pj4gcGF0Y2ggdG8gdGhlIHZlcnkgZW5kIHRvIGF2b2lkIGludGVy
bWl0dGVudCBicmVha2FnZS4KPj4+Pj4+Cj4+Pj4+PiBJIGFsc28gdGhpbmsgdGhhdCB0aGUgZHJp
dmVyJ3MgYmVoYXZpb3IgaXMgYSBiaXQgaGFyc2guIEkgdGhpbmsgCj4+Pj4+PiBpdCB3b3VsZAo+
Pj4+Pj4gYmUgYmV0dGVyIGZvciB0aGUgVUFSVCBkcml2ZXIgdG8gcHJpbnQgYSB3YXJuaW5nIGFu
ZCBmYWxsIGJhY2sgdG8KPj4+Pj4+IFBJTyBmb3IgY29uc29sZSBpbnN0ZWFkIG9mIG91dHJpZ2h0
IHJlZnVzaW5nIGFuZCByZW5kZXJpbmcgdGhlIAo+Pj4+Pj4gc3lzdGVtCj4+Pj4+PiBzaWxlbnQu
IFRoYXQncyBub3QgbXV0dWFsbHkgZXhjbHVzaXZlIHdpdGggeW91ciBwYXRjaCBzZXJpZXMgaGVy
ZSwKPj4+Pj4+IG9mIGNvdXJzZS4KPj4+Pj4+Cj4+Pj4+PiBDaGVlcnMsCj4+Pj4+PiBBaG1hZAo+
Pj4+Pj4KPj4+Pgo+Pj4+IFRoZSBkcml2ZXIgaW1wbGVtZW50YXRpb24gd2lsbCBjb25zaWRlciB0
aGUgcmVxdWVzdCB0byBwcm9iZSB0aGUgVUFSVAo+Pj4+IGNvbnNvbGUgaW4gRE1BIG1vZGUgYXMg
YW4gZXJyb3IgKC1FTk9ERVYpLCBhbmQgd2lsbCBmYWxsYmFjayB0aGlzIAo+Pj4+IFVBUlQgcHJv
YmUKPj4+PiBpbiBpcnEgbW9kZS4KPj4+Cj4+Pj4gV2hhdGV2ZXIgdGhlIHBhdGNoIG9yZGVyaW5n
LCB0aGUgYm9vdCB3aWxsIG5ldmVyIGJlIGJyb2tlbi4gVGhlIAo+Pj4+IGJvYXJkIGR0Cj4+Pj4g
cGF0Y2hlcyBhaW0gdG8gZ2V0IGEgInByb3BlciIgaW1wbGVtZW50YXRpb24sIGJ1dCBmcm9tIGZ1
bmN0aW9uYWwKPj4+PiBwZXJzcGVjdGl2ZSB0aGUgZHJpdmVyIHdpbGwgbWFuYWdlIGEgcmVxdWVz
dCB0byBwcm9iZSBhbiBVQVJUIAo+Pj4+IGNvbnNvbGUgaW4gRE1BCj4+Pj4gbW9kZSBhcyBhbiBl
cnJvciBhbmQgZmFsbCBpdCBiYWNrIGluIGlycSBtb2RlLgo+Pj4KPj4+IEkgZGlkbid0IGRlYnVn
IHRoaXMgZnVydGhlciB5ZXQsIGJ1dCBteSBtYWNoaW5lICh3aXRoIGFuIG91dC1vZi10cmVlCj4+
PiBkdHMpIGZhaWxzIHRvIGJvb3QgNi4xLXJjNCB3aXRob3V0IHJlbW92aW5nIHRoZSBkbWEgcHJv
cGVydGllcyBmcm9tIHRoZQo+Pj4gY29uc29sZSBVQVJULiBUaGlzIGlzIGEgYnVnIGlzbid0IGl0
PyBUaGUgc2FtZSBkdHMgY3JlYXRlZCBhIHdvcmtpbmcKPj4+IHNldHVwIHdpdGggc3RtMzJtcDE1
Ny5kdHNpIGZyb20gNS4xNSArIGtlcm5lbCA1LjE1Lgo+Cj4gSGkgVXdlLAo+Cj4gQ291bGQgeW91
IGNvbmZpcm0gZWFybHljb24gaXMgZW5hYmxlZCBvbiB5b3VyIHNldHVwPwo+Cj4gV2l0aG91dCBl
YXJseWNvbiwgYm9vdCBpcyBvaywgZXZlbiB3aXRoIGRtYSBwcm9wZXJ0aWVzLCBhdCBsZWFzdCBv
biAKPiBzdG0zMm1wMTU3Yy1kazIuCj4KPj4+Cj4+PiBJIGNhbiBkZWJ1ZyB0aGlzIGZ1cnRoZXIs
IGJ1dCBtYXliZSB5b3Uga25vdyBvZmYtaGFuZCB3aGF0IHRoZSBwcm9ibGVtCj4+PiBpcz8KPj4K
Pj4gK0NDIEFtZWxpZSwgYXMgdGhpcyBtaWdodCBiZSByZWxhdGVkIHRvIHRoZSBETUEgc2VyaWVz
IHRoYXQgbGFuZGVkIAo+PiByZWNlbnRseToKPj4KPj4gJCBnaXQgbG9nIC0tb25lbGluZSB2NS4x
OC4udjYuMCAtLSBkcml2ZXJzL2RtYS9zdG0zMioKPgo+IEhpIE1hcmVrLAo+Cj4gV2UgaGF2ZW4n
dCB5ZXQgaW52ZXN0aWdhdGVkIHRoZSBpc3N1ZSwgYW5kIGlmIGxhdGVzdCBETUEgdXBkYXRlcyBj
b3VsZCAKPiBleHBsYWluIHdoeSBlYXJseWNvbiBicmVha3MgdGhlIGJvb3QuCj4KPgo+ICtUTyBW
YWxlbnRpbiwgYXMgaGUncyBub3cgaW4gY2hhcmdlIG9mIFVBUlQgZHJpdmVyLgo+IFZhbGVudGlu
IGFuZCBJIHdpbGwgaW52ZXN0aWdhdGUgdGhpcyBpc3N1ZS4KPgo+IFJlZ2FyZHMsCj4gQW1lbGll
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==

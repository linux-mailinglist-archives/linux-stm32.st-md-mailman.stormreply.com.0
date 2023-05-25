Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50695710719
	for <lists+linux-stm32@lfdr.de>; Thu, 25 May 2023 10:15:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 039A1C6A61A;
	Thu, 25 May 2023 08:15:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51AB0C0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 May 2023 08:15:19 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34P6vCna010987; Thu, 25 May 2023 10:14:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : from : subject : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=6eqB/2RVN5f/EsmFhOLILkPDHswfNdCOdRhZtrk1duU=;
 b=K+tsvG6ECwhzWGvIrNzOwpjUqyOubAhwbi2QX4tUeFUYHRsm9Nb4JX0jBpFYvkxuBplF
 DxOwlBlN0UZpkNadjuB2e5Q++17yRrTayHjHprSnkQdNHsgJqVZyEYQ2RKgO6/R2sNIy
 DQ30QwWdeNvSW560OuPSk2VffPS7Cj/z2qEAuJou5eO5yRxVxMSjzbygIvlHhBMaA4yG
 oM5PMGD85Y7sKFbwhr9kvSyCjaJwVyLOOqFjyZfffrHFcQwbD8t7tkCDMUNFo0GtMHJv
 Y/XK385ajzTVd8EzcoimwS7aKwflkwBwF7Ml7EdMNanRpmOjdrulTBCwUzW98+hE/6kR Jw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qt2uy8k3c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 May 2023 10:14:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B6BE810002A;
 Thu, 25 May 2023 10:14:53 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A5474212FDC;
 Thu, 25 May 2023 10:14:53 +0200 (CEST)
Received: from [10.252.18.243] (10.252.18.243) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 25 May
 2023 10:14:52 +0200
Message-ID: <32fafa74-8964-c9cf-f95b-f2cd084f46c6@foss.st.com>
Date: Thu, 25 May 2023 10:14:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
To: Marek Vasut <marex@denx.de>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Yannick Fertre <yannick.fertre@foss.st.com>
References: <20230517143542.284029-1-raphael.gallais-pou@foss.st.com>
 <20230517143542.284029-4-raphael.gallais-pou@foss.st.com>
 <f64de05b-8854-4345-80c2-f424968defdc@denx.de>
 <e963370c-7018-243a-712d-62ca8463bfd8@foss.st.com>
 <5f201903-17cb-5054-763c-f03b1066db1d@denx.de>
Content-Language: en-US
In-Reply-To: <5f201903-17cb-5054-763c-f03b1066db1d@denx.de>
X-Originating-IP: [10.252.18.243]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-25_04,2023-05-24_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@dh-electronics.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 3/3] ARM: dts: stm32: fix several DT
 warnings on stm32mp15
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

Ck9uIDUvMTgvMjMgMDE6MzMsIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDUvMTcvMjMgMTk6MDQs
IFJhcGhhZWwgR2FsbGFpcy1Qb3Ugd3JvdGU6Cj4+IEhpIE1hcmVrCj4KPiBIaSwKPgo+PiBPbiA1
LzE3LzIzIDE3OjQxLCBNYXJlayBWYXN1dCB3cm90ZToKPj4+IE9uIDUvMTcvMjMgMTY6MzUsIFJh
cGhhZWwgR2FsbGFpcy1Qb3Ugd3JvdGU6Cj4+Pgo+Pj4gSGksCj4+Pgo+Pj4+IGRpZmYgLS1naXQg
YS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTV4eC1ka3guZHRzaQo+Pj4+IGIvYXJjaC9hcm0v
Ym9vdC9kdHMvc3RtMzJtcDE1eHgtZGt4LmR0c2kKPj4+PiBpbmRleCAwZjExMTBlNDJjOTMuLmE2
ZTJlMjBmMTJmYSAxMDA2NDQKPj4+PiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTV4
eC1ka3guZHRzaQo+Pj4+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNXh4LWRreC5k
dHNpCj4+Pj4gQEAgLTQ1Nyw4ICs0NTcsNyBAQCAmbHRkYyB7Cj4+Pj4gwqDCoMKgwqDCoMKgIHN0
YXR1cyA9ICJva2F5IjsKPj4+PiDCoMKgIMKgwqDCoMKgwqAgcG9ydCB7Cj4+Pj4gLcKgwqDCoMKg
wqDCoMKgIGx0ZGNfZXAwX291dDogZW5kcG9pbnRAMCB7Cj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcmVnID0gPDA+Owo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBsdGRjX2VwMF9vdXQ6IGVuZHBv
aW50IHsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlbW90ZS1lbmRwb2ludCA9
IDwmc2lpOTAyMl9pbj47Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKPj4+PiDCoMKgwqDC
oMKgwqAgfTsKPj4+Cj4+PiBUaGlzIExUREMgcG9ydC9lbmRwb2ludCBzdHVmZiBhbHdheXMgc2Nh
cmVzIG1lLCBiZWNhdXNlIEkgYWx3YXlzIGZlZWwgSSBnZXQgaXQKPj4+IHdyb25nLgo+Pj4KPj4+
IEkgYmVsaWV2ZSB0aGUgTFREQyBkb2VzIGhhdmUgb25lICJwb3J0IiAsIGNvcnJlY3QuCj4+Pgo+
Pj4gQnV0IEkgdGhpbmsgKD8pIHRoYXQgdGhlIExUREMgaGFzIHR3byBlbmRwb2ludHMsIGVuZHBv
aW50QDAgZm9yIERQSSAocGFyYWxsZWwKPj4+IG91dHB1dCBvdXQgb2YgdGhlIFNvQykgYW5kIGVu
ZHBvaW50QDEgZm9yIERTSSAoaW50ZXJuYWwgY29ubmVjdGlvbiBpbnRvIHRoZQo+Pj4gRFNJIHNl
cmlhbGl6ZXIpID8KPj4KPj4gWW91IGFyZSBjb3JyZWN0IGluZGVlZCwgSSBydXNoZWQgdGhlIHBh
dGNoIGFuZCBkaWQgbm90IHRob3VnaHQgYWJvdXQgdGhpcy4gSQo+PiBhZ3JlZSB0aGF0IHRoaXMg
Y2FuIGJlIGNvbmZ1c2luZywgYXMgSSBhbHNvIHRha2Ugc29tZSB0aW1lIHRvIHRoaW5rIHRocm91
Z2ggaXQuCj4+Cj4+Pgo+Pj4gT25seSBvbmUgb2YgdGhlIGVuZHBvaW50cyBjYW4gYmUgY29ubmVj
dGVkIGF0IGEgdGltZSwgYnV0IHRoZXJlIGFyZSBhY3R1YWxseQo+Pj4gdHdvIGVuZHBvaW50cyBp
biB0aGUgTFREQyBwb3J0IHt9IG5vZGUsIGFyZW4ndCB0aGVyZSA/Cj4+IFllcywgdGhleSBhcmUg
bXV0dWFsbHkgZXhjbHVzaXZlLgo+Pj4KPj4+IFNvIHRoZSBvcmlnaW5hbCBkZXNjcmlwdGlvbiBz
aG91bGQgYmUgT0sgSSB0aGluayAsIG1heWJlICNhZGRyZXNzLyNzaXplLWNlbGxzCj4+PiBhcmUg
bWlzc2luZyBpbnN0ZWFkID8KPj4KPj4gVGhpbmcgaXM6IHRoaXMgZmlsZSBpcyBvbmx5IGluY2x1
ZGVkIGluIHR3byBkZXZpY2UtdHJlZXMgOiBzdG0zMm1wMTU3Yy1kazEuZHRzCj4+IGFuZCBzdG0z
Mm1wMTU3Yy1kazIuZHRzLgo+Pgo+PiBBbW9uZyB0aG9zZSB0d28gZmlsZXMgdGhlcmUgaXMgb25s
eSBvbmUgd2hpY2ggYWRkcyBhIHNlY29uZCBlbmRwb2ludC4gVGh1cyBpZgo+PiB0aGUgZmllbGRz
IGFyZSBzZXQgaGlnaGVyIGluIHRoZSBoaWVyYXJjaHksIGEgd2FybmluZyB5aWVsZHMuCj4KPiBJ
IGRvIG5vdCB1bmRlcnN0YW5kIHRoaXMgb25lIHBhcnQsIHdoaWNoIHdhcm5pbmcgYXJlIHlvdSB0
cnlpbmcgdG8gZml4ID8KPiBJIGp1c3QgcmFuICckIG1ha2UgQ0hFQ0tfRFRCUz0xIHN0bTMybXAx
NTdhLWRrMS5kdGIgc3RtMzJtcDE1N2MtZGsyLmR0YicgaW4KPiBsYXRlc3QgbGludXgtbmV4dCBh
bmQgdGhlcmUgd2FzIG5vIHdhcm5pbmcgcmVsYXRlZCB0byBMVERDIC4KCkknbSBzb3JyeSwgSSBs
b29rZWQgYmFjayBhdCBpdCBhbmQgbXkgZXhwbGFuYXRpb25zIGFyZSBjb25mdXNpbmcuCgpJIHVz
ZSBBbGV4IFRvcmd1ZSdzIHRyZWUsIGFuZCBJJ20gYmFzZWQgb24gdGhlIG5leHQgYnJhbmNoLCBi
dXQgbGludXgtbmV4dApzaG91bGQgYmUgdGhlIHNhbWUgSSBqdXN0IGNoZWNrZWQgaXQuCgo+Cj4g
SSB0aGluayBpZiB5b3UgcmV0YWluIHRoZSBzdG0zMm1wMTUxLmR0c2kgJmx0ZGMgeyBwb3J0IHsg
I2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gI3NpemUtY2VsbHMgPSA8MD47IH07IH07IHBhcnQsIHRo
ZW4geW91IHdvdWxkbid0IGJlIGdldHRpbmcgYW55IHdhcm5pbmdzCj4gcmVnYXJkaW5nIExUREMg
LCBhbmQgeW91IHdvdWxkbid0IGhhdmUgdG8gcmVtb3ZlIHRoZSB1bml0LWFkZHJlc3MgZnJvbQo+
IGVuZHBvaW50QDAgLgo+Cj4gYnR3LiBJIGRvIHVzZSBib3RoIGVuZHBvaW50QDAvZW5kcG9pbnRA
MSBpbiBBdmVuZ2VyOTYgRFRPcywgYnV0IHRob3NlIGFyZSBub3QKPiBzdWJtaXR0ZWQgeWV0LCBJ
IGhhdmUgdG8gY2xlYW4gdGhlbSB1cCBhIGJpdCBtb3JlIGZpcnN0Lgo+Cj4+IE9uZSB3YXkgdG8g
ZG8gaXQgd291bGQgYmUgdG8gbWFrZSB0aGUgZW5kcG9pbnRAMCBnbyBkb3duIGluIHRoZSBkZXZp
Y2UtdHJlZSB3aXRoCj4+IGl0cyBkZXBlbmRlbmNpZXMsIHNvIHRoYXQgYm90aCBlbmRwb2ludHMg
YXJlIHRoZSBzYW1lIGxldmVsIHdpdGhvdXQgZ2VuZXJhdGluZwo+PiBub2lzZS4KPgo+IEknbSBh
ZnJhaWQgSSByZWFsbHkgZG9uJ3QgcXVpdGUgdW5kZXJzdGFuZCB3aGljaCB3YXJuaW5nIHlvdSdy
ZSByZWZlcnJpbmcgdG8uCj4gQ2FuIHlvdSBwbGVhc2Ugc2hhcmUgdGhhdCB3YXJuaW5nIGFuZCBp
ZGVhbGx5IGhvdyB0byB0cmlnZ2VyIGl0ICh0aGUKPiBjb21tYW5kLWxpbmUgaW5jYW50YXRpb24p
ID8KClVzaW5nICckIG1ha2UgZHRicyBXPTEnLCB5b3UgY2FuIG9ic2VydmUgc2V2ZXJhbCBvZiB0
aGUgZm9sbG93aW5nczoKCmFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTEuZHRzaToxNTMzLjkt
MTUzNi42OiBXYXJuaW5nCihhdm9pZF91bm5lY2Vzc2FyeV9hZGRyX3NpemUpOiAvc29jL2Rpc3Bs
YXktY29udHJvbGxlckA1YTAwMTAwMC9wb3J0Ogp1bm5lY2Vzc2FyeSAjYWRkcmVzcy1jZWxscy8j
c2l6ZS1jZWxscyB3aXRob3V0ICJyYW5nZXMiIG9yIGNoaWxkICJyZWciIHByb3BlcnR5CmFyY2gv
YXJtL2Jvb3QvZHRzL3N0bTMybXAxNTEuZHRzaToxNTMzLjktMTUzNi42OiBXYXJuaW5nIChncmFw
aF9jaGlsZF9hZGRyZXNzKToKL3NvYy9kaXNwbGF5LWNvbnRyb2xsZXJANWEwMDEwMDAvcG9ydDog
Z3JhcGggbm9kZSBoYXMgc2luZ2xlIGNoaWxkIG5vZGUKJ2VuZHBvaW50QDAnLCAjYWRkcmVzcy1j
ZWxscy8jc2l6ZS1jZWxscyBhcmUgbm90IG5lY2Vzc2FyeQoKVGhpcyAmbHRkYyB7IHBvcnQgeyAj
YWRkcmVzcy1jZWxscyA9IDwxPjsgI3NpemUtY2VsbHMgPSA8MD47IH07IH07IHBhcnQgaXMKYWN0
dWFsbHkgYW5ub3lpbmcuIFRoaXMgaXMgYmVjYXVzZSB0aGVyZSBpcyBzZXZlcmFsIGRldmljZS10
cmVlcyB0aGF0IG9ubHkgZ290Cm9uZSBlbmRwb2ludCwgYW5kIHNvbWUgb3RoZXIgdGhhdCBpbmNs
dWRlcyB0d28uCgpGb3IgaW5zdGFuY2U6IHN0bTMybXAxNXh4LWRoY29yLWF2ZW5nZXI5Ni5kdHNp
IHZzIHN0bTMybXAxNTdjLWRrMi5kdHMuCgpJIHdvdWxkIGxpa2UgdG8gcmVtb3ZlIHRvIHJvb3Qg
cGFydCBvZiBhZGRyZXNzL3NpemUgZmllbGQgYW5kIGxldCBvbmx5IHRoZSBsb3dlcgpkZXZpY2Ut
dHJlZXMgd2l0aCB3aXRoIG11bHRpcGxlIGVuZHBvaW50cyBoYW5kbGUgdGhlaXIgb3duIGZpZWxk
cy4gSSBob3BlIHRoaXMKZXhwbGFpbnMgYSBiaXQgYmV0dGVyIG15IHByb2Nlc3MuCgpSZWdhcmRz
LApSYXBoYcOrbCBHYWxsYWlzLVBvdQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK

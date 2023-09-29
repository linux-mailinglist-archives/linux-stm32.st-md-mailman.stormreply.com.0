Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2F27B3357
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Sep 2023 15:19:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A48E6C6B477;
	Fri, 29 Sep 2023 13:19:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A94C5C6B474
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Sep 2023 13:19:29 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38TABSom007571; Fri, 29 Sep 2023 15:18:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:from:to:cc:references
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=KMM5HFfGi3/V+NX/zIj16MtndrNJ3wjO6VBqQEWwOzE=; b=ga
 rM6WT7soC9Qg5lgEynlNIDEz19ICFxdBxx8K4WKaa81yBoo69ZoqQgPtPJrk+yqH
 6Ke+T4tgb/wvQ7+D6b8/REeHXj+x3qhuVXstjmlbfDXVsD7fnq1otz0IBlMfWVfL
 E4pait5J8DRp751sajaRVoUu+IBQuOKISwGGaDU+w8jkYTr9fXxKlpYDQovtoe8f
 gElrQ2fdRogxsh24zwaguSO+d3txrH3Ag2t7373pPcvxthqul803q1iHU52Zkj5N
 HDkK8wgJgLFXVxL19kvPUsq9yAyQ76DfuoiJhXjgKUsphyNPOIYM5JXL5gCdij8s
 EmQ/SdD52jWC2koKfFGg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ta9k0s0fb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Sep 2023 15:18:50 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AE29710002A;
 Fri, 29 Sep 2023 15:18:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4AB3A2865FC;
 Fri, 29 Sep 2023 15:18:48 +0200 (CEST)
Received: from [10.201.20.32] (10.201.20.32) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 29 Sep
 2023 15:18:46 +0200
Message-ID: <6e419e89-10f1-e448-10fe-64f1ea9ff862@foss.st.com>
Date: Fri, 29 Sep 2023 15:18:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
To: Greg KH <gregkh@linuxfoundation.org>
References: <20230811100731.108145-1-gatien.chevallier@foss.st.com>
 <20230811100731.108145-2-gatien.chevallier@foss.st.com>
 <2023081117-sprout-cruncher-862c@gregkh>
 <4f0f9d6c-ce4d-73a2-60bf-801c1a1d6cc3@foss.st.com>
Content-Language: en-US
In-Reply-To: <4f0f9d6c-ce4d-73a2-60bf-801c1a1d6cc3@foss.st.com>
X-Originating-IP: [10.201.20.32]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-29_11,2023-09-28_03,2023-05-22_02
Cc: ulf.hansson@linaro.org, linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 edumazet@google.com, Oleksii_Moisieiev@epam.com,
 krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
 will@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 peng.fan@oss.nxp.com, herbert@gondor.apana.org.au,
 Frank Rowand <frowand.list@gmail.com>, hugues.fruchet@foss.st.com,
 lee@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 andi.shyti@kernel.org, alsa-devel@alsa-project.org, richardcochran@gmail.com,
 robh+dt@kernel.org, linux-serial@vger.kernel.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, arnd@kernel.org, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, vkoul@kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, davem@davemloft.net,
 jic23@kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [IGNORE][PATCH v4 01/11] dt-bindings: Document
 common device controller bindings
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

CgpPbiA4LzExLzIzIDE0OjAwLCBHYXRpZW4gQ0hFVkFMTElFUiB3cm90ZToKPiAKPiAKPiBPbiA4
LzExLzIzIDEyOjE2LCBHcmVnIEtIIHdyb3RlOgo+PiBPbiBGcmksIEF1ZyAxMSwgMjAyMyBhdCAx
MjowNzoyMVBNICswMjAwLCBHYXRpZW4gQ2hldmFsbGllciB3cm90ZToKPj4+IEZyb206IE9sZWtz
aWkgTW9pc2llaWV2IDxPbGVrc2lpX01vaXNpZWlldkBlcGFtLmNvbT4KPj4+Cj4+PiBJbnRyb2R1
Y2luZyBvZiB0aGUgY29tbW9uIGRldmljZSBjb250cm9sbGVyIGJpbmRpbmdzIGZvciB0aGUgY29u
dHJvbGxlcgo+Pj4gcHJvdmlkZXIgYW5kIGNvbnN1bWVyIGRldmljZXMuIFRob3NlIGJpbmRpbmdz
IGFyZSBpbnRlbmRlZCB0byBhbGxvdwo+Pj4gZGl2aWRlZCBzeXN0ZW0gb24gY2hpcCBpbnRvIG11
bHRpcGxlIGRvbWFpbnMsIHRoYXQgY2FuIGJlIHVzZWQgdG8KPj4+IGNvbmZpZ3VyZSBoYXJkd2Fy
ZSBwZXJtaXNzaW9ucy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2lpIE1vaXNpZWlldiA8
b2xla3NpaV9tb2lzaWVpZXZAZXBhbS5jb20+Cj4+PiBbR2F0aWVuOiBGaXggdHlwb3MgYW5kIFlB
TUwgZXJyb3JdCj4+PiBTaWduZWQtb2ZmLWJ5OiBHYXRpZW4gQ2hldmFsbGllciA8Z2F0aWVuLmNo
ZXZhbGxpZXJAZm9zcy5zdC5jb20+Cj4+PiAtLS0KPj4+Cj4+PiBDaGFuZ2VzIGluIFY0Ogo+Pj4g
wqDCoMKgwqBDb3JyZWN0ZWQgdHlwb3MgYW5kIFlBTUwgZXJyb3JzCj4+Cj4+IFdoeSBhcmUgd2Ug
c3VwcG9zZWQgdG8gaWdub3JlIHRoZSBmaXJzdCBwYXRjaCBpbiB0aGlzIHNlcmllcywgYnV0IHBh
eQo+PiBhdHRlbnRpb24gdG8gdGhlIDEwIGFmdGVyIHRoaXMgdGhhdCBkZXBlbmQgb24gaXQ/Cj4+
Cj4+IHRvdGFsbHkgY29uZnVzZWQsCj4+Cj4+IGdyZWcgay1oCj4gCj4gSGVsbG8gR3JlZywKPiAK
PiBJJ20gc29ycnkgdGhhdCB0aGlzIHRhZyB0cm91YmxlcyB5b3VyIHJldmlldy4gSXQgd2FzIGZp
cnN0IHN1Z2dlc3RlZAo+IGluIFsxXS4gVGhlICJJR05PUkUiIG1lYW5zIGlnbm9yZSByZXZpZXcg
b24gdGhpcyB0aHJlYWQsIGFzIGl0IGlzIHN0aWxsCj4gdW5kZXIgcmV2aWV3IGluIGFub3RoZXIg
dGhyZWFkIChMaW5rIGluIHRoZSBjb3ZlciBsZXR0ZXIpLiBJdCBkb2VzIG5vdAo+IG1lYW4gdGhh
dCB0aGUgY29udGVudCBzaG91bGQgYmUgaWdub3JlZCBmb3IgdGhlIHNlcmllcy4gSSB3aWxsIGNo
YW5nZQo+IHRoaXMgdG8gc29tZXRoaW5nIGVsc2UgYXMgdGhpcyBpcyBvYnZpb3VzbHkgY29uZnVz
aW5nIHRoZSByZXZpZXcuCj4gCj4gQE9sZWtzaWksIGNhbiB3ZSBpbWFnaW5lIGludGVncmF0aW5n
IHRoaXMgcGF0Y2ggdG8gdGhpcyBzZXJpZXMgb3IgZG8KPiB5b3UgcHJlZmVyIHRvIGtlZXAgaXQg
YXBhcnQ/Cj4gCgpIaSwKCmFmdGVyIGEgZGlzY3Vzc2lvbiB3aXRoIE9sZWtzaWk6IEknbGwgcmVu
YW1lIHRoZSBiaW5kaW5nIHRvIG5hcnJvdwpkb3duIGl0cyBzY29wZSBhbmQgaW50ZWdyYXRlIHRo
ZSBwYXRjaCBpbiBteSBzZXJpZXMuIFRoaXMgd2F5LCBJJ2xsIGRyb3AKdGhlIFtJR05PUkVdIHRh
Zy4KCj0+IEknbGwgc3RpY2sgd2l0aCB0aGUgZ2VuZXJpYyBiaW5kaW5nIGZvciBWNSAoU29ycnkg
Zm9yIHRoZSBtaXNsZWFkaW5nCiAgICBpbmZvcm1hdGlvbiBpbiB0aGUgcHJldmlvdXMgbWFpbCkK
CkJlc3QgcmVnYXJkcywKR2F0aWVuCgo+IFNob3VsZCBJIGNvbnNpZGVyIGEgcmVzZW5kIHdpdGgg
YW5vdGhlciB0YWcgaWYgT2xla3NpaSBwcmVmZXJzIHRvIGtlZXAKPiB0aGlzIHBhdGNoIGFwYXJ0
Pwo+IAo+IFsxXSAKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMWU0OThiOTMtZDNiZC1i
ZDEyLWU5OTEtZTNmNGJlZGY2MzJkQGxpbmFyby5vcmcvCj4gCj4gQmVzdCByZWdhcmRzLAo+IEdh
dGllbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=

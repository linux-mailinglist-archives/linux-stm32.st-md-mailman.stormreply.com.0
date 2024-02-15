Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1087C855C1F
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Feb 2024 09:17:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5984C62EFE;
	Thu, 15 Feb 2024 08:17:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD7A7C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Feb 2024 08:16:59 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41F4sA47004833; Thu, 15 Feb 2024 09:16:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=pvtxoJhmnxjDqlBcy+m+EW9LOlI+xq+K0k8SrAAqebE=; b=Ll
 wQoB5bNmOCHjXB2SCCmpVtLVgogBAq/lsnMsEXcHnmd7akpjA9jW0dcVBIsjuS0d
 1iJ3S0YpVb2PtkhoEoGgUAlFLaqgoZYajYG6xIhCreTDu8f0/rm0xPBvVM4FiGL5
 ne4Od0shXVEpMGTcaPw+wnFyF10+pvG3/R43G+6/4XW+QBdm9RsR4hxVErJ3Re4v
 hFfKP+JHR79ICT9LVugA4wQvPtjCIwprp9YP22xZUe+RY2wUhYkZnnrFQY3bAoiE
 Hmi5tOYSHPP+8d71epf3fY4+AgPIAdPHi+tqOySlEn0P+fBYJeWYslHZeS823Fvl
 XB7EDKmskozTibHJoyYA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3w62sj256t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Feb 2024 09:16:29 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A1B434002D;
 Thu, 15 Feb 2024 09:16:19 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6DF8122F7CF;
 Thu, 15 Feb 2024 09:15:14 +0100 (CET)
Received: from [10.129.178.155] (10.129.178.155) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 15 Feb
 2024 09:15:12 +0100
Message-ID: <77b05018-bdab-4737-a64b-1b7404626200@foss.st.com>
Date: Thu, 15 Feb 2024 09:15:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, Sam
 Ravnborg <sam@ravnborg.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20240205-ltdc_mp13-v1-0-072d24bf1b36@foss.st.com>
 <0c551a84-5c4a-4d79-ae59-d5b0d34b017d@foss.st.com>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <0c551a84-5c4a-4d79-ae59-d5b0d34b017d@foss.st.com>
X-Originating-IP: [10.129.178.155]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_08,2024-02-14_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, Yannick Fertre <yannick.fertre@foss.st.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/5] Add display support for
	stm32mp135f-dk board
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

SGkgQWxleAoKT24gMi8xNC8yNCAxNDo0MCwgQWxleGFuZHJlIFRPUkdVRSB3cm90ZToKPiBIaSBS
YXBoYWVsCj4KPiBPbiAyLzUvMjQgMTA6MDYsIFJhcGhhZWwgR2FsbGFpcy1Qb3Ugd3JvdGU6Cj4+
IFRoaXMgc2VyaWUgYWltcyB0byBlbmFibGUgZGlzcGxheSBzdXBwb3J0IGZvciB0aGUgc3RtMzJt
cDEzNWYtZGsgYm9hcmQKPj4KPj4gVGhvc2UgYXJlIG9ubHkgcGF0Y2hlcyBvZiB0aGUgZGV2aWNl
LXRyZWUgc2luY2UgdGhlIGRyaXZlciBzdXBwb3J0IGhhcwo+PiBhbHJlYWR5IGJlZW4gYWRkZWQg
WzFdLgo+Pgo+PiBJdCByZXNwZWN0aXZlbGx5Ogo+PiDCoMKgwqDCoC0gYWRkcyBzdXBwb3J0IGZv
ciB0aGUgZGlzcGxheSBjb250cm9sbGVyIG9uIHN0bTMybXAxMzUKPj4gwqDCoMKgwqAtIGFkZHMg
cGluY3RybCBmb3IgdGhlIGRpc3BsYXkgY29udHJvbGxlcgo+PiDCoMKgwqDCoC0gZW5hYmxlcyBw
YW5lbCwgYmFja2xpZ2h0IGFuZCBkaXNwbGF5IGNvbnRyb2xsZXIgb24KPj4gwqDCoMKgwqDCoCBz
dG0zMm1wMTM1Zi1kawo+Pgo+PiBGaW5hbGx5IGl0IGZpeGVzIHRoZSBmbGFncyBvbiB0aGUgcGFu
ZWwgZGVmYXVsdCBtb2RlIGluIHRoZQo+PiAncGFuZWwtc2ltcGxlJyBkcml2ZXIsIGFsbG93aW5n
IHRvIG92ZXJyaWRlIHRoZSBkZWZhdWx0IG1vZGUgYnkgb25lCj4+IGRlc2NyaWJlZCBpbiB0aGUg
ZGV2aWNlIHRyZWUsIGFuZCBwdXNoIGZ1cnRoZXIgdGhlIGJsYW5raW5nIGxpbWl0IG9uIHRoZQo+
PiBwYW5lbC4KPj4KPj4gWzFdIGNvbW1pdCAxNzI2Y2VlM2QwNTMgKCJkcm0vc3RtOiBsdGRjOiBz
dXBwb3J0IG9mIG5ldyBoYXJkd2FyZSB2ZXJzaW9uIikKPj4KPj4gU2lnbmVkLW9mZi1ieTogUmFw
aGFlbCBHYWxsYWlzLVBvdSA8cmFwaGFlbC5nYWxsYWlzLXBvdUBmb3NzLnN0LmNvbT4KPj4gLS0t
Cj4+IFJhcGhhZWwgR2FsbGFpcy1Qb3UgKDUpOgo+PiDCoMKgwqDCoMKgwqAgQVJNOiBkdHM6IHN0
bTMyOiBhZGQgTFREQyBzdXBwb3J0IGZvciBTVE0zMk1QMTN4IFNvQyBmYW1pbHkKPj4gwqDCoMKg
wqDCoMKgIEFSTTogZHRzOiBzdG0zMjogYWRkIExUREMgcGluY3RybCBvbiBTVE0zMk1QMTN4IFNv
QyBmYW1pbHkKPj4gwqDCoMKgwqDCoMKgIEFSTTogZHRzOiBzdG0zMjogZW5hYmxlIGRpc3BsYXkg
c3VwcG9ydCBvbiBzdG0zMm1wMTM1Zi1kayBib2FyZAo+PiDCoMKgwqDCoMKgwqAgZHJtL3BhbmVs
OiBzaW1wbGU6IGZpeCBmbGFncyBvbiBSSzA0M0ZONDhICj4+IMKgwqDCoMKgwqDCoCBkcm0vcGFu
ZWw6IHNpbXBsZTogcHVzaCBibGFua2luZyBsaW1pdCBvbiBSSzMyRk40OEgKPj4KPj4gwqAgYXJj
aC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEzLXBpbmN0cmwuZHRzaSB8IDU3ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrCj4+IMKgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMzUu
ZHRzacKgwqDCoMKgwqDCoMKgIHwgMTEgKysrKysrCj4+IMKgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0
L3N0bTMybXAxMzVmLWRrLmR0c8KgwqDCoMKgIHwgNTUgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmPCoMKgwqDCoMKg
wqDCoCB8wqAgNyArKy0tCj4+IMKgIDQgZmlsZXMgY2hhbmdlZCwgMTI3IGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCj4+IC0tLQo+PiBiYXNlLWNvbW1pdDogNjYxMzQ3NmUyMjVlMDkwY2M5
YWFkNDliZTdmYTUwNGUyOTBkZDMzZAo+PiBjaGFuZ2UtaWQ6IDIwMjQwMTI0LWx0ZGNfbXAxMy0y
Zjg2YTc4MjQyNGMKPj4KPj4gQmVzdCByZWdhcmRzLAo+Cj4gSSBnb3QgdGhlIGZvbGxvd2luZyBl
cnJvcnMgZHVyaW5nIFlBTUwgdmVyaWZpY2F0aW9uOgo+Cj4gYXJjaC9hcm0vYm9vdC9kdHMvc3Qv
c3RtMzJtcDEzNWYtZGsuZHRiOiAvc29jL2kyY0A0MDAxMjAwMC9waW5jdHJsQDIxOiBmYWlsZWQK
PiB0byBtYXRjaCBhbnkgc2NoZW1hIHdpdGggY29tcGF0aWJsZTogWydtaWNyb2NoaXAsbWNwMjMw
MTcnXQo+IC9sb2NhbC9ob21lL2ZycTA4Njc4L1NUTElOVVgva2VybmVsL215LWtlcm5lbC9zdG0z
Mi9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTM1Zi1kay5kdGI6Cj4gcGFuZWwtYmFja2xp
Z2h0OiAnZGVmYXVsdC1icmlnaHRuZXNzLWxldmVsJyBkb2VzIG5vdCBtYXRjaCBhbnkgb2YgdGhl
IHJlZ2V4ZXM6Cj4gJ3BpbmN0cmwtWzAtOV0rJwo+IMKgwqDCoMKgZnJvbSBzY2hlbWEgJGlkOgo+
IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2xlZHMvYmFja2xpZ2h0L2dwaW8tYmFja2xp
Z2h0LnlhbWwjCj4gL2xvY2FsL2hvbWUvZnJxMDg2NzgvU1RMSU5VWC9rZXJuZWwvbXkta2VybmVs
L3N0bTMyL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMzVmLWRrLmR0YjoKPiBwYW5lbC1y
Z2I6IGRhdGEtbWFwcGluZzowOiAnYmdyNjY2JyBpcyBub3Qgb25lIG9mIFsnamVpZGEtMTgnLCAn
amVpZGEtMjQnLAo+ICd2ZXNhLTI0J10KPiDCoMKgwqDCoGZyb20gc2NoZW1hICRpZDoKPiBodHRw
Oi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L3BhbmVsL3BhbmVsLXNpbXBsZS55YW1s
Iwo+IC9sb2NhbC9ob21lL2ZycTA4Njc4L1NUTElOVVgva2VybmVsL215LWtlcm5lbC9zdG0zMi9h
cmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTM1Zi1kay5kdGI6Cj4gcGFuZWwtcmdiOiBjb21w
YXRpYmxlOiBbJ3JvY2t0ZWNoLHJrMDQzZm40OGgnLCAncGFuZWwtZHBpJ10gaXMgdG9vIGxvbmcK
PiDCoMKgwqDCoGZyb20gc2NoZW1hICRpZDoKPiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1h
cy9kaXNwbGF5L3BhbmVsL3BhbmVsLXNpbXBsZS55YW1sIwo+IC9sb2NhbC9ob21lL2ZycTA4Njc4
L1NUTElOVVgva2VybmVsL215LWtlcm5lbC9zdG0zMi9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0z
Mm1wMTM1Zi1kay5kdGI6Cj4gcGFuZWwtcmdiOiBkYXRhLW1hcHBpbmc6IEZhbHNlIHNjaGVtYSBk
b2VzIG5vdCBhbGxvdyBbJ2JncjY2NiddCj4gwqDCoMKgwqBmcm9tIHNjaGVtYSAkaWQ6Cj4gaHR0
cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS9wYW5lbC9wYW5lbC1zaW1wbGUueWFt
bCMKPiAvbG9jYWwvaG9tZS9mcnEwODY3OC9TVExJTlVYL2tlcm5lbC9teS1rZXJuZWwvc3RtMzIv
YXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEzNWYtZGsuZHRiOgo+IHBhbmVsLXJnYjogJ2hl
aWdodC1tbScsICdwYW5lbC10aW1pbmcnLCAnd2lkdGgtbW0nIGRvIG5vdCBtYXRjaCBhbnkgb2Yg
dGhlCj4gcmVnZXhlczogJ3BpbmN0cmwtWzAtOV0rJwo+IMKgwqDCoMKgZnJvbSBzY2hlbWEgJGlk
Ogo+IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtc2lt
cGxlLnlhbWwjCj4gL2xvY2FsL2hvbWUvZnJxMDg2NzgvU1RMSU5VWC9rZXJuZWwvbXkta2VybmVs
L3N0bTMyL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMzVmLWRrLmR0YjoKPiBwYW5lbC1y
Z2I6ICdkYXRhLW1hcHBpbmcnIGRvZXMgbm90IG1hdGNoIGFueSBvZiB0aGUgcmVnZXhlczogJ3Bp
bmN0cmwtWzAtOV0rJwo+IMKgwqDCoMKgZnJvbSBzY2hlbWEgJGlkOiBodHRwOi8vZGV2aWNldHJl
ZS5vcmcvc2NoZW1hcy9kaXNwbGF5L3BhbmVsL3BhbmVsLWRwaS55YW1sIwo+Cj4gRG8gSSBtaXNz
IHNvbWV0aGluZyA/CgoKSSB0aGluayBJIG1lc3NlZCB1c2luZyBhIHdyb25nwqAgbWFrZSBvcHRp
b24gOgoKbWFrZSBEVEJTX0NIRUNLPXkgVz0xIC1qJChucHJvYykgc3Qvc3RtMzJtcDEzNWYtZGsu
ZHRiCgppbnN0ZWFkIG9mCgptYWtlIENIRUNLX0RUQlM9eSBXPTEgLWokKG5wcm9jKSBzdC9zdG0z
Mm1wMTM1Zi1kay5kdGIKCgpJJ2xsIHNlbmQgYSBmaXggcHJvbXB0bHkuCgoKVGhhbmtzLAoKUmFw
aGHDq2wKCj4KPiBBbGV4Cj4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=

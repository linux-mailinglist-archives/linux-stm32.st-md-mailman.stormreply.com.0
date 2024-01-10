Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F11A1829E69
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jan 2024 17:22:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7A6EC6A61D;
	Wed, 10 Jan 2024 16:22:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E466C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jan 2024 16:22:29 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40AFqjcj006046; Wed, 10 Jan 2024 17:21:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=0lcmvy10VZgJVbxhJSRvChfEOTXYBSl765GGGCaCPCc=; b=EI
 38OfCZbtxSRr5yjDuwBBs5Ss8halUTdeerybUJJLG8A/1n4281auvTFRJdgtKCMW
 yfDoFHXImKhBghVaHLUQGnlXFbUvKtmCkWcSdVg5iq8OW9lImWc11SChjE+CXtJY
 fgLqwfgygsc1KFEWUyG8qTQ7Xxshq4+VqJ80sqHbo38IVk2D1dRUjTMFHqT4T+lB
 hjmxLNBZlMauHFOjw3MGADOrsCDKTkqeOUfKBsXzZwWy2ubNGxLkhqAnsFsaX0S8
 /MmliOEdBqRyh3fNmAeS4vUtLhXzOcht29ocExQ6vEQ8OQqSqA7AM2gqK8Trg/LY
 GttNoODiSzluYBtdCyKw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vexrc9769-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jan 2024 17:21:52 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2D0B010002A;
 Wed, 10 Jan 2024 17:21:48 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CD533209730;
 Wed, 10 Jan 2024 17:21:48 +0100 (CET)
Received: from [10.252.16.30] (10.252.16.30) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 10 Jan
 2024 17:21:48 +0100
Message-ID: <34be5ba8-fa6a-4bd2-8c6e-673bae7d2354@foss.st.com>
Date: Wed, 10 Jan 2024 17:21:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231221124339.420119-1-raphael.gallais-pou@foss.st.com>
 <20231221124339.420119-5-raphael.gallais-pou@foss.st.com>
 <CAA8EJpq-NWUEe8QbUwDHu0BBSViWKh92PujD7PA84xgvSUsvhg@mail.gmail.com>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <CAA8EJpq-NWUEe8QbUwDHu0BBSViWKh92PujD7PA84xgvSUsvhg@mail.gmail.com>
X-Originating-IP: [10.252.16.30]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_08,2024-01-05_01,2023-05-22_02
Cc: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Sam Ravnborg <sam@ravnborg.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-kernel@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH RESEND v1 4/8] drm/stm: ltdc: implement
	bus clock
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

Ck9uIDEyLzIxLzIzIDE0OjE3LCBEbWl0cnkgQmFyeXNoa292IHdyb3RlOgo+IE9uIFRodSwgMjEg
RGVjIDIwMjMgYXQgMTQ6NDUsIFJhcGhhZWwgR2FsbGFpcy1Qb3UKPiA8cmFwaGFlbC5nYWxsYWlz
LXBvdUBmb3NzLnN0LmNvbT4gd3JvdGU6Cj4+IEZyb206IFlhbm5pY2sgRmVydHJlIDx5YW5uaWNr
LmZlcnRyZUBmb3NzLnN0LmNvbT4KPj4KPj4gVGhlIGxhdGVzdCBoYXJkd2FyZSB2ZXJzaW9uIG9m
IHRoZSBMVERDIHByZXNlbnRzIHRoZSBhZGRpdGlvbiBvZiBhIGJ1cwo+PiBjbG9jaywgd2hpY2gg
Y29udGFpbnMgdGhlIGdsb2JhbCBjb25maWd1cmF0aW9uIHJlZ2lzdGVycyBhbmQgdGhlIGludGVy
cnVwdAo+PiByZWdpc3Rlci4KPj4KPj4gU2lnbmVkLW9mZi1ieTogWWFubmljayBGZXJ0cmUgPHlh
bm5pY2suZmVydHJlQGZvc3Muc3QuY29tPgo+PiAtLS0KPj4gIGRyaXZlcnMvZ3B1L2RybS9zdG0v
bHRkYy5jIHwgOCArKysrKysrKwo+PiAgZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmggfCAxICsK
Pj4gIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4gSSBtaWdodCBiZSBtaXNzaW5n
IHNvbWV0aGluZywgYnV0IEkgZG9uJ3Qgc2VlIHRoaXMgY2xvY2sgYmVpbmcgc2V0Cj4gKGNvbXBh
cmUgdGhpcyBwYXRjaCB0byB0aGUgcGF0Y2ggNS84KQoKCkhpIERtaXRyeSwKClRoaXMgcGF0Y2gg
bmVlZHMgcmV3b3JrLiBJJ2xsIGRyb3AgaXQgZm9yIG5vdyBhbmQgc2VuZCBpdCBiYWNrIGxhdGVy
IHdoZW4gaXQgaXMKbW9yZSBtYXR1cmUuCgpSZWdhcmRzLAoKUmFwaGHDq2wKCj4KPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9s
dGRjLmMKPj4gaW5kZXggNTU3NmZkYWU0OTYyLi42NzA2NGY0N2E0Y2IgMTAwNjQ0Cj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0v
bHRkYy5jCj4+IEBAIC0xODk2LDYgKzE4OTYsOCBAQCB2b2lkIGx0ZGNfc3VzcGVuZChzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGRldikKPj4KPj4gICAgICAgICBEUk1fREVCVUdfRFJJVkVSKCJcbiIpOwo+
PiAgICAgICAgIGNsa19kaXNhYmxlX3VucHJlcGFyZShsZGV2LT5waXhlbF9jbGspOwo+PiArICAg
ICAgIGlmIChsZGV2LT5idXNfY2xrKQo+PiArICAgICAgICAgICAgICAgY2xrX2Rpc2FibGVfdW5w
cmVwYXJlKGxkZXYtPmJ1c19jbGspOwo+PiAgfQo+Pgo+PiAgaW50IGx0ZGNfcmVzdW1lKHN0cnVj
dCBkcm1fZGV2aWNlICpkZGV2KQo+PiBAQCAtMTkxMCw2ICsxOTEyLDEyIEBAIGludCBsdGRjX3Jl
c3VtZShzdHJ1Y3QgZHJtX2RldmljZSAqZGRldikKPj4gICAgICAgICAgICAgICAgIERSTV9FUlJP
UigiZmFpbGVkIHRvIGVuYWJsZSBwaXhlbCBjbG9jayAoJWQpXG4iLCByZXQpOwo+PiAgICAgICAg
ICAgICAgICAgcmV0dXJuIHJldDsKPj4gICAgICAgICB9Cj4+ICsgICAgICAgaWYgKGxkZXYtPmJ1
c19jbGspIHsKPj4gKyAgICAgICAgICAgICAgIGlmIChjbGtfcHJlcGFyZV9lbmFibGUobGRldi0+
YnVzX2NsaykpIHsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgRFJNX0VSUk9SKCJVbmFibGUg
dG8gcHJlcGFyZSBidXMgY2xvY2tcbiIpOwo+PiArICAgICAgICAgICAgICAgICAgICAgICByZXR1
cm4gLUVOT0RFVjsKPj4gKyAgICAgICAgICAgICAgIH0KPj4gKyAgICAgICB9Cj4+Cj4+ICAgICAg
ICAgcmV0dXJuIDA7Cj4+ICB9Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0
ZGMuaCBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5oCj4+IGluZGV4IDlkNDg4MDQzZmZkYi4u
MTU1ZDhlNGE3YzZiIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuaAo+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuaAo+PiBAQCAtNDQsNiArNDQsNyBAQCBz
dHJ1Y3QgbHRkY19kZXZpY2Ugewo+PiAgICAgICAgIHZvaWQgX19pb21lbSAqcmVnczsKPj4gICAg
ICAgICBzdHJ1Y3QgcmVnbWFwICpyZWdtYXA7Cj4+ICAgICAgICAgc3RydWN0IGNsayAqcGl4ZWxf
Y2xrOyAgLyogbGNkIHBpeGVsIGNsb2NrICovCj4+ICsgICAgICAgc3RydWN0IGNsayAqYnVzX2Ns
azsgICAgLyogYnVzIGNsb2NrICovCj4+ICAgICAgICAgc3RydWN0IG11dGV4IGVycl9sb2NrOyAg
LyogcHJvdGVjdGluZyBlcnJvcl9zdGF0dXMgKi8KPj4gICAgICAgICBzdHJ1Y3QgbHRkY19jYXBz
IGNhcHM7Cj4+ICAgICAgICAgdTMyIGlycV9zdGF0dXM7Cj4+IC0tCj4+IDIuMjUuMQo+Pgo+Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==

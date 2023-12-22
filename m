Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C24881C6D1
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Dec 2023 09:47:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08CAEC6C820;
	Fri, 22 Dec 2023 08:47:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36164C6B477
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Dec 2023 08:47:34 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3BM8gWRR020437; Fri, 22 Dec 2023 09:46:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=geMwC/2ntrBKDmWRx2A6oK+EjPDa7RQe5GUkgEu5yMA=; b=19
 jzXM/cdHYRiNxPeaXV9jlu54ksQqvS/HkDVNh9fbrMOGaGAv3jpGrybJL+HhrVuc
 ocFnig6wO69DtuqybcCbfaOs+AF/JAxXEP7PZLRhVpDNOjd9t9yqJUuiqZy57XPF
 qZJUes8XzS+jMRr0K6pm9+dLrV3RQUaYaT6nhGlsdWG9o85usXvA1KdLR9/IOf5A
 AAV39EcbTHmyRo9r962D7sGIy7h9WakKLgeB0OFWPstsbcK4ndsaIHSfH9ZXhE0g
 YfDNeq0WSYQrzHYRfxeARZhE0hTrDrIzcrMjcb35barCTBO+L5sMLgL0ki1sAJQp
 H+H+Omhfylvf2wOt6hPw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3v1442bj0f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Dec 2023 09:46:04 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BD515100060;
 Fri, 22 Dec 2023 09:46:00 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6C53A20B23A;
 Fri, 22 Dec 2023 09:46:00 +0100 (CET)
Received: from [10.252.15.82] (10.252.15.82) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 22 Dec
 2023 09:45:59 +0100
Message-ID: <5c5fde3c-8073-430c-b9e6-b3e6d84eddee@foss.st.com>
Date: Fri, 22 Dec 2023 09:45:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20231221124339.420119-1-raphael.gallais-pou@foss.st.com>
 <20231221124339.420119-3-raphael.gallais-pou@foss.st.com>
 <170316995910.3869238.14321525013510097521.robh@kernel.org>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <170316995910.3869238.14321525013510097521.robh@kernel.org>
X-Originating-IP: [10.252.15.82]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-22_04,2023-12-21_02,2023-05-22_02
Cc: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 David Airlie <airlied@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>,
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
Subject: Re: [Linux-stm32] [PATCH RESEND v1 2/8] dt-bindings: display: add
 dt-bindings for STM32 LVDS device
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

SGkgUm9iCgpPbiAxMi8yMS8yMyAxNTo0NSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gVGh1LCAy
MSBEZWMgMjAyMyAxMzo0MzozMyArMDEwMCwgUmFwaGFlbCBHYWxsYWlzLVBvdSB3cm90ZToKPj4g
QWRkIGR0LWJpbmRpbmcgZmlsZSBmb3IgInN0LHN0bTMyLWx2ZHMiIGNvbXBhdGlibGUuCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IFJhcGhhZWwgR2FsbGFpcy1Qb3UgPHJhcGhhZWwuZ2FsbGFpcy1wb3VA
Zm9zcy5zdC5jb20+Cj4+IC0tLQo+PiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvc3Qsc3RtMzItbHZk
cy55YW1sICAgICAgIHwgMTE0ICsrKysrKysrKysrKysrKysrKwo+PiAgMSBmaWxlIGNoYW5nZWQs
IDExNCBpbnNlcnRpb25zKCspCj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3Qsc3RtMzItbHZkcy55YW1sCj4+Cj4gTXkgYm90
IGZvdW5kIGVycm9ycyBydW5uaW5nICdtYWtlIERUX0NIRUNLRVJfRkxBR1M9LW0gZHRfYmluZGlu
Z19jaGVjaycKPiBvbiB5b3VyIHBhdGNoIChEVF9DSEVDS0VSX0ZMQUdTIGlzIG5ldyBpbiB2NS4x
Myk6Cj4KPiB5YW1sbGludCB3YXJuaW5ncy9lcnJvcnM6Cj4KPiBkdHNjaGVtYS9kdGMgd2Fybmlu
Z3MvZXJyb3JzOgo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N0
LHN0bTMyLWx2ZHMuZXhhbXBsZS5kdHM6MTg6MTg6IGZhdGFsIGVycm9yOiBkdC1iaW5kaW5ncy9i
dXMvc3RtMzJtcDI1X3N5c19idXMuaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo+ICAgIDE4
IHwgICAgICAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvYnVzL3N0bTMybXAyNV9zeXNfYnVzLmg+
Cj4gICAgICAgfCAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn4KPiBjb21waWxhdGlvbiB0ZXJtaW5hdGVkLgo+IG1ha2VbMl06ICoqKiBbc2NyaXB0
cy9NYWtlZmlsZS5saWI6NDE5OiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9zdCxzdG0zMi1sdmRzLmV4YW1wbGUuZHRiXSBFcnJvciAxCj4gbWFrZVsyXTogKioqIFdh
aXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4KPiBtYWtlWzFdOiAqKiogWy9idWlsZHMvcm9i
aGVycmluZy9kdC1yZXZpZXctY2kvbGludXgvTWFrZWZpbGU6MTQyNDogZHRfYmluZGluZ19jaGVj
a10gRXJyb3IgMgo+IG1ha2U6ICoqKiBbTWFrZWZpbGU6MjM0OiBfX3N1Yi1tYWtlXSBFcnJvciAy
CgpUaGlzIGlzIGJlY2F1c2UgSSBmb3Jnb3QgdG8gcmVtb3ZlIHRoaXMgbGluZSBmcm9tIHRoZSBl
eGFtcGxlLiBJJ2xsIHJlbW92ZSBpdCBpbiBWMi4KCgpUaGFua3MsCgpSYXBoYcOrbAoKCj4gZG9j
IHJlZmVyZW5jZSBlcnJvcnMgKG1ha2UgcmVmY2hlY2tkb2NzKToKPgo+IFNlZSBodHRwczovL3Bh
dGNod29yay5vemxhYnMub3JnL3Byb2plY3QvZGV2aWNldHJlZS1iaW5kaW5ncy9wYXRjaC8yMDIz
MTIyMTEyNDMzOS40MjAxMTktMy1yYXBoYWVsLmdhbGxhaXMtcG91QGZvc3Muc3QuY29tCj4KPiBU
aGUgYmFzZSBmb3IgdGhlIHNlcmllcyBpcyBnZW5lcmFsbHkgdGhlIGxhdGVzdCByYzEuIEEgZGlm
ZmVyZW50IGRlcGVuZGVuY3kKPiBzaG91bGQgYmUgbm90ZWQgaW4gKnRoaXMqIHBhdGNoLgo+Cj4g
SWYgeW91IGFscmVhZHkgcmFuICdtYWtlIGR0X2JpbmRpbmdfY2hlY2snIGFuZCBkaWRuJ3Qgc2Vl
IHRoZSBhYm92ZQo+IGVycm9yKHMpLCB0aGVuIG1ha2Ugc3VyZSAneWFtbGxpbnQnIGlzIGluc3Rh
bGxlZCBhbmQgZHQtc2NoZW1hIGlzIHVwIHRvCj4gZGF0ZToKPgo+IHBpcDMgaW5zdGFsbCBkdHNj
aGVtYSAtLXVwZ3JhZGUKPgo+IFBsZWFzZSBjaGVjayBhbmQgcmUtc3VibWl0IGFmdGVyIHJ1bm5p
bmcgdGhlIGFib3ZlIGNvbW1hbmQgeW91cnNlbGYuIE5vdGUKPiB0aGF0IERUX1NDSEVNQV9GSUxF
UyBjYW4gYmUgc2V0IHRvIHlvdXIgc2NoZW1hIGZpbGUgdG8gc3BlZWQgdXAgY2hlY2tpbmcKPiB5
b3VyIHNjaGVtYS4gSG93ZXZlciwgaXQgbXVzdCBiZSB1bnNldCB0byB0ZXN0IGFsbCBleGFtcGxl
cyB3aXRoIHlvdXIgc2NoZW1hLgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==

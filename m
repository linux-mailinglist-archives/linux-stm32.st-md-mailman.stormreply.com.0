Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6C881C6D9
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Dec 2023 09:49:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39F8BC6C820;
	Fri, 22 Dec 2023 08:49:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2E79C6B477
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Dec 2023 08:49:56 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3BM5kUo5029531; Fri, 22 Dec 2023 09:48:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=DXnKNS2zZsB/JGQbwoIOXKKoinM3JySMYdHFE4nrpZE=; b=gZ
 TkRA7JkKE/ZLWoAT+HRyZ9u8wnxdq+/ialw26uKASyNf1c7NtnXE3K4kliKag55X
 VakRbzK16GQE2JVTbMWGGenrIFfXn0I97np3raSdI+Qd+048BV6hZK0+bJMznTcn
 8Y3iJTu4NCiviZ2O+3oL+VVFwxRafZa3skEAroeCNS22v52nqEtPMv8VyoyrEOJM
 EH9u0QB6Cs6UTvJkNGV4uBvjU3lggSaytQKGkMxh+f+LWrKD+VDZEzhSFxMONcIe
 RrEl6u1JKG4TolrXFBYxvF+4FoK2O4H5t34zcR9tdSYM72kaQ3vLMpY09+yblKRJ
 Z95BufTojylX3aM78dCQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3v54ksrm2v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Dec 2023 09:48:59 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1D82E10004F;
 Fri, 22 Dec 2023 09:48:40 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0FB4220B607;
 Fri, 22 Dec 2023 09:48:40 +0100 (CET)
Received: from [10.252.15.82] (10.252.15.82) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 22 Dec
 2023 09:48:39 +0100
Message-ID: <24110918-5402-4877-a80f-db1228afeaa1@foss.st.com>
Date: Fri, 22 Dec 2023 09:48:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, Sam
 Ravnborg <sam@ravnborg.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Philippe Cornu <philippe.cornu@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thierry Reding
 <thierry.reding@gmail.com>
References: <20231221122843.418650-1-raphael.gallais-pou@foss.st.com>
 <20231221122843.418650-3-raphael.gallais-pou@foss.st.com>
 <fcd68fbe-c543-4b6d-9b7f-bcea09918fb9@linaro.org>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <fcd68fbe-c543-4b6d-9b7f-bcea09918fb9@linaro.org>
X-Originating-IP: [10.252.15.82]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-22_04,2023-12-21_02,2023-05-22_02
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v1 2/8] dt-bindings: display: add
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

SGkgS3J6eXN6dG9mLAoKClRoYW5rcyBmb3IgeW91ciByZXZpZXcuIEkgd2FsbCBzZW5kIGFub3Ro
ZXIgc2VyaWUgbGF0ZXIgd2l0aCB0aG9zZSBtb2RpZmljYXRpb25zLgoKCkJlc3QgcmVnYXJkcywK
ClJhcGhhw6tsCgoKT24gMTIvMjEvMjMgMTg6MjcsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6
Cj4gT24gMjEvMTIvMjAyMyAxMzoyOCwgUmFwaGFlbCBHYWxsYWlzLVBvdSB3cm90ZToKPj4gQWRk
IGR0LWJpbmRpbmcgZmlsZSBmb3IgInN0LHN0bTMyLWx2ZHMiIGNvbXBhdGlibGUuCj4+Cj4gQSBu
aXQsIHN1YmplY3Q6IGRyb3Agc2Vjb25kL2xhc3QsIHJlZHVuZGFudCAiZHQtYmluZGluZ3MgZm9y
Ii4gVGhlCj4gImR0LWJpbmRpbmdzIiBwcmVmaXggaXMgYWxyZWFkeSBzdGF0aW5nIHRoYXQgdGhl
c2UgYXJlIGJpbmRpbmdzLgo+Cj4+IFNpZ25lZC1vZmYtYnk6IFJhcGhhZWwgR2FsbGFpcy1Qb3Ug
PHJhcGhhZWwuZ2FsbGFpcy1wb3VAZm9zcy5zdC5jb20+Cj4+IC0tLQo+PiAgLi4uL2JpbmRpbmdz
L2Rpc3BsYXkvc3Qsc3RtMzItbHZkcy55YW1sICAgICAgIHwgMTE0ICsrKysrKysrKysrKysrKysr
Kwo+PiAgMSBmaWxlIGNoYW5nZWQsIDExNCBpbnNlcnRpb25zKCspCj4+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3Qsc3RtMzIt
bHZkcy55YW1sCj4+Cj4gLi4uCj4KPj4gK3Byb3BlcnRpZXM6Cj4+ICsgICIjY2xvY2stY2VsbHMi
Ogo+PiArICAgIGNvbnN0OiAwCj4+ICsKPj4gKyAgY29tcGF0aWJsZToKPj4gKyAgICBjb25zdDog
c3Qsc3RtMzItbHZkcwo+IFBsZWFzZSBwdXQgY29tcGF0aWJsZSBhcyBmaXJzdC4KPgo+PiArCj4+
ICsgIHJlZzoKPj4gKyAgICBtYXhJdGVtczogMQo+PiArCj4+ICsgIGNsb2NrczoKPj4gKyAgICBp
dGVtczoKPj4gKyAgICAgIC0gZGVzY3JpcHRpb246IEFQQiBwZXJpcGhlcmFsIGNsb2NrCj4+ICsg
ICAgICAtIGRlc2NyaXB0aW9uOiBSZWZlcmVuY2UgY2xvY2sgZm9yIHRoZSBpbnRlcm5hbCBQTEwK
Pj4gKwo+PiArICBjbG9jay1uYW1lczoKPj4gKyAgICBpdGVtczoKPj4gKyAgICAgIC0gY29uc3Q6
IHBjbGsKPj4gKyAgICAgIC0gY29uc3Q6IHJlZgo+PiArCj4+ICsgIHJlc2V0czoKPj4gKyAgICBt
YXhJdGVtczogMQo+PiArCj4+ICsgIHBvcnRzOgo+PiArICAgICRyZWY6IC9zY2hlbWFzL2dyYXBo
LnlhbWwjL3Byb3BlcnRpZXMvcG9ydHMKPj4gKwo+PiArICAgIHByb3BlcnRpZXM6Cj4+ICsgICAg
ICBwb3J0QDA6Cj4+ICsgICAgICAgICRyZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwjL3Byb3BlcnRp
ZXMvcG9ydAo+PiArICAgICAgICBkZXNjcmlwdGlvbjogfAo+PiArICAgICAgICAgIExWRFMgaW5w
dXQgcG9ydCBub2RlLCBjb25uZWN0ZWQgdG8gdGhlIExUREMgUkdCIG91dHB1dCBwb3J0Lgo+PiAr
Cj4+ICsgICAgICBwb3J0QDE6Cj4+ICsgICAgICAgICRyZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwj
L3Byb3BlcnRpZXMvcG9ydAo+PiArICAgICAgICBkZXNjcmlwdGlvbjogfAo+PiArICAgICAgICAg
IExWRFMgb3V0cHV0IHBvcnQgbm9kZSwgY29ubmVjdGVkIHRvIGEgcGFuZWwgb3IgYnJpZGdlIGlu
cHV0IHBvcnQuCj4gUG9ydHMgYXJlIG5vdCByZXF1aXJlZD8gSSB3b3VsZCBhc3N1bWUgaXQgd29u
J3Qgd29yayB3aXRob3V0IGlucHV0IGFuZAo+IG91dHB1dC4KPgo+PiArCj4+ICtyZXF1aXJlZDoK
Pj4gKyAgLSAiI2Nsb2NrLWNlbGxzIgo+PiArICAtIGNvbXBhdGlibGUKPj4gKyAgLSByZWcKPj4g
KyAgLSBjbG9ja3MKPj4gKyAgLSBjbG9jay1uYW1lcwo+PiArICAtIHJlc2V0cwo+PiArICAtIHBv
cnRzCj4+ICsKPj4gK3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKPiBhZGRpdGlvbmFsUHJv
cGVydGllcyBpbnN0ZWFkLi4uIG9yIGRpZCBJIG1pc3Mgc29tZSAkcmVmIGFueXdoZXJlPwo+Cj4+
ICsKPj4gK2V4YW1wbGVzOgo+PiArICAtIHwKPj4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3Mv
YnVzL3N0bTMybXAyNV9zeXNfYnVzLmg+Cj4+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Ns
b2NrL3N0bTMybXAyNS1jbGtzLmg+Cj4+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Jlc2V0
L3N0bTMybXAyNS1yZXNldHMuaD4KPj4gKwo+PiArICAgIGx2ZHM6IGx2ZHNANDgwNjAwMDAgewo+
PiArICAgICAgICAjY2xvY2stY2VsbHMgPSA8MD47Cj4+ICsgICAgICAgIGNvbXBhdGlibGUgPSAi
c3Qsc3RtMzItbHZkcyI7Cj4gY29tcGF0aWJsZSBpcyBhbHdheXMgdGhlIGZpcnN0IHByb3BlcnR5
Lgo+Cj4+ICsgICAgICAgIHJlZyA9IDwweDQ4MDYwMDAwIDB4MjAwMD47Cj4gcHV0IGNsb2NrLWNl
bGxzIGhlcmUKPgo+PiArICAgICAgICBjbG9ja3MgPSA8JnJjYyBDS19CVVNfTFZEUz4sIDwmcmNj
IENLX0tFUl9MVkRTUEhZPjsKPj4gKyAgICAgICAgY2xvY2stbmFtZXMgPSAicGNsayIsICJyZWYi
Owo+PiArICAgICAgICByZXNldHMgPSA8JnJjYyBMVkRTX1I+Owo+IEJlc3QgcmVnYXJkcywKPiBL
cnp5c3p0b2YKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=

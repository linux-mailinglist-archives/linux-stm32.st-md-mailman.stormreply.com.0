Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C6B8610EE
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Feb 2024 13:01:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FAE7C6B47A;
	Fri, 23 Feb 2024 12:01:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB44AC69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Feb 2024 12:01:45 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41N6mxgP014804; Fri, 23 Feb 2024 13:01:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=4m/fBb7GPXD4Ccm5qYBxfwkW2HiwOoGWraBdyJd7n/M=; b=tO
 JEEK41uclKoKSLfz+xvlmAvWpsDVGhP3/6sutYdJXrfgd1a3CCwi5slWcNl9gSDi
 Y5viqyweHuHDRDxCNSuv4yzbTZrrKG8gr0DXRolJfSK8lAIYSHzSaWy+RVoT5YwI
 /vZCY+5eO3Wd73hXAlsLDTRl4ZcC833vBBLpGMmBZ8/8ps+9XRTBYoPxw7c81Z+F
 1zSxCZXYbsOiFFNefljr68Jfmq6mj/NT91u4qOnMF11Q/xizLGCiToABNlMnEdf6
 LVy+g69fuFblawGnz3CoL7+6J4leyzxgveGtC0aWQKQEuH3bXMYGCa56WDNgmFSR
 Wx1/DqWPc14kIeeJ2kXw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wd203vfwr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Feb 2024 13:01:10 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6D17440044;
 Fri, 23 Feb 2024 13:00:58 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BE7D62816D2;
 Fri, 23 Feb 2024 12:59:45 +0100 (CET)
Received: from [10.129.178.151] (10.129.178.151) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 23 Feb
 2024 12:59:44 +0100
Message-ID: <833a7287-69ff-4976-bfc6-16fabf2fa6a5@foss.st.com>
Date: Fri, 23 Feb 2024 12:59:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rob Herring <robh@kernel.org>
References: <20240217-ltdc_mp13-v2-0-50881f1b394e@foss.st.com>
 <20240217-ltdc_mp13-v2-4-50881f1b394e@foss.st.com>
 <20240223000946.GA3848625-robh@kernel.org>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20240223000946.GA3848625-robh@kernel.org>
X-Originating-IP: [10.129.178.151]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_15,2024-02-23_01,2023-05-22_02
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 4/4] dt-bindings: display: simple:
 hardware can use several properties
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

Ck9uIDIvMjMvMjQgMDE6MDksIFJvYiBIZXJyaW5nIHdyb3RlOgo+IE9uIFNhdCwgRmViIDE3LCAy
MDI0IGF0IDEyOjAyOjU4UE0gKzAxMDAsIFJhcGhhZWwgR2FsbGFpcy1Qb3Ugd3JvdGU6Cj4+IFNl
dHRpbmcgYSBwYW5lbC10aW1pbmcgaW4gdGhlIGRldmljZS10cmVlIG92ZXJ3cml0ZSB0aGUgb25l
IHNwZWNpZmllZCBpbgo+PiB0aGUgZHJpdmVyIGFuZCBzZXQgaXQgYXMgcHJlZmVycmVkLiAgSW4g
dGhhdCBjYXNlICdoZWlnaHQtbW0nLAo+PiAnd2lkdGgtbW0nIGFuZCAncGFuZWwtdGltaW5nJyBh
cmUgcHJvcGVydGllcyB0aGF0IGNhbiBiZSB1c2UgZm9yIHNpbXBsZQo+PiBwYW5lbHMsIGFjY29y
ZGluZyB0byBwYW5lbC1jb21tb24ueWFtbAo+Pgo+PiBGaXhlcyBmb2xsb3dpbmcgd2FybmluZ3M6
Cj4+IGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMzVmLWRrLmR0YjogcGFuZWwtcmdiOiAn
aGVpZ2h0LW1tJywgJ3BhbmVsLXRpbWluZycsICd3aWR0aC1tbScgZG8gbm90IG1hdGNoIGFueSBv
ZiB0aGUgcmVnZXhlczogJ3BpbmN0cmwtWzAtOV0rJwo+PiAJZnJvbSBzY2hlbWEgJGlkOiBodHRw
Oi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L3BhbmVsL3BhbmVsLXNpbXBsZS55YW1s
Iwo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBSYXBoYWVsIEdhbGxhaXMtUG91IDxyYXBoYWVsLmdhbGxh
aXMtcG91QGZvc3Muc3QuY29tPgo+PiAtLS0KPj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLXNpbXBsZS55YW1sIHwgMyArKysKPj4gIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLXNpbXBsZS55YW1sIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtc2lt
cGxlLnlhbWwKPj4gaW5kZXggNjM0YTEwYzZmMmRkLi5jMDJjYmJjN2ExMDAgMTAwNjQ0Cj4+IC0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVs
LXNpbXBsZS55YW1sCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3BhbmVsL3BhbmVsLXNpbXBsZS55YW1sCj4+IEBAIC0zNTIsNiArMzUyLDkgQEAgcHJv
cGVydGllczoKPj4gICAgbm8taHBkOiB0cnVlCj4+ICAgIGhwZC1ncGlvczogdHJ1ZQo+PiAgICBk
YXRhLW1hcHBpbmc6IHRydWUKPj4gKyAgaGVpZ2h0LW1tOiB0cnVlCj4+ICsgIHdpZHRoLW1tOiB0
cnVlCj4+ICsgIHBhbmVsLXRpbWluZzogdHJ1ZQpIaSBSb2IsCj4gSW5zdGVhZCwganVzdCBjaGFu
Z2UgJ2FkZGl0aW9uYWxQcm9wZXJ0aWVzJyB0byAndW5ldmFsdWF0ZVByb3BlcnRpZXMnIAo+IGFu
ZCBkcm9wIGFsbCB0aGVzZSAncHJvcDogdHJ1ZScgbGluZXMuIFByZXR0eSBtdWNoIGFueXRoaW5n
IGZyb20gCj4gcGFuZWwtY29tbW9uLnlhbWwgc2hvdWxkIGJlIGFsbG93ZWQuCgoKV2lsbCBkbywg
dGhhbmtzIDopCgoKQmVzdCByZWdhcmRzLAoKUmFwaGHDq2wKCj4KPiBSb2IKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK

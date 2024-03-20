Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1090788131D
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Mar 2024 15:14:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8847C6B46B;
	Wed, 20 Mar 2024 14:14:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A5C7C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Mar 2024 14:14:54 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42KCsf8Y009234; Wed, 20 Mar 2024 15:14:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:from:subject:to:cc:references
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=eSHpvYuMMA/7BKJU5oieTcXas1/vD/WRye6gXn0CtRg=; b=3t
 jsBrSNTz94dOlnVw3NzCmHyRKqn5pL2dbmyDh/jG4Xm4mPjDC8lXa6z9EMWXNBEA
 62r+Q3Wcnk54cm5nUYpzFNOWhmEf0oZYEIPjJvGF6LnB7BBpzW4s0qt9MXfDyGiP
 QWdYBsGYQBlMg3rxRUZY9WGekI24bc+ORFG1XS1VeyY4QN3FbRumbDyBjzoQNOTh
 cQgk+HhcPAktTAmO+RAZl0X5gop/KbeO/aMJd8rS3G0j3QEzwelWJOTvqyvYAHvl
 tDSHQLJKymIEb+Q+rL7/GkMUIKfUMr6h0+mR393GS88osl1eFBsMSc6i17QnnLCa
 76uid9qmsL5CkhyDBSuw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ww1e99wet-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Mar 2024 15:14:39 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9A60840045;
 Wed, 20 Mar 2024 15:14:35 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0DE9825F7C5;
 Wed, 20 Mar 2024 15:14:27 +0100 (CET)
Received: from [10.129.178.79] (10.129.178.79) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 20 Mar
 2024 15:14:25 +0100
Message-ID: <99dad358-0ca8-4f19-9d0c-e41c095db8c7@foss.st.com>
Date: Wed, 20 Mar 2024 15:14:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
To: Sean Nyekjaer <sean@geanix.com>, <yannick.fertre@foss.st.com>,
 <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, Antonio Maria BORNEO - foss
 <antonio.borneo@foss.st.com>
References: <4A53A669-C3AF-4D29-B5A5-0F7FEBA79045@geanix.com>
Content-Language: en-US
In-Reply-To: <4A53A669-C3AF-4D29-B5A5-0F7FEBA79045@geanix.com>
X-Originating-IP: [10.129.178.79]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-20_09,2024-03-18_03,2023-05-22_02
Cc: =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>
Subject: Re: [Linux-stm32] STM32 DSI controller driver: mode_valid clock
	tolerance
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

Ck9uIDMvOC8yNCAwOTozNSwgU2VhbiBOeWVramFlciB3cm90ZToKPiBIaSwKCgpIaSBTZWFuLAoK
ClNvcnJ5IGZvciBub3QgcmVzcG9uZGluZyBlYXJsaWVyLgoKSSd2ZSBhbHNvIGFkZGVkIEFudG9u
aW8gQm9ybmVvLCB3aGljaCBpcyB0aGUgYXV0aG9yIG9mIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiB0
aGUKbW9kZV92YWxpZCgpIGhvb2suCgo+IEnigJltIHVzaW5nIGEgc3RtMzJtcDE1NyB3aXRoIGEg
c242NWRzaTgzIERTSTJMVkRTIGJyaWRnZS4KPiBUaGUgTFZEUyBkaXNwbGF5IGlzIGhhdmluZyBh
IG1pbmltdW0gY2xvY2sgb2YgMjUuMiBNSHosIHR5cGljYWwgb2YgMjcsMiBNSHogYW5kIGEgbWF4
IG9mIDMwLDUgTUh6Lgo+Cj4gSSB3aWxsIGZhaWwgdGhlIG1vZGVfdmFsaWQgY2hlY2sgd2l0aCBN
T0RFX0NMT0NLX1JBTkdFLgo+IEl0IHdpbGwgcmVxdWVzdCAyNzIwMDAwMCBIeiwgYnV0IGlzIGdl
dHRpbmcgMjcyNTAwMDAuIEd1ZXNzIHRoZSBkaXNwbGF5IGlzIGZpbmUgd2l0aCB0aGlzIDopCj4K
PiBJbiB0aGlzIGNhc2UgaXQgc2VlbXMgYSBiaXQgaGFyc2ggdG8gZmFpbCBpZiB0aGUgb3V0cHV0
IGNsb2NrIGlzbuKAmXQgd2l0aGluIDUwIEh6IG9mIHRoZSByZXF1ZXN0ZWQgY2xvY2suCj4KPiBJ
ZiBIRE1JIGlzIHJlcXVpcmluZyBhIHRvbGVyYW5jZSBvZiA1MCBIeiwgd291bGQgaXQgYmUgYmV0
dGVyIHRvIGRvIHRoZSBjaGVjayBpbiB0aGUgSERNSSBicmlkZ2UgZHJpdmVyPwoKQXQgdGhlIHRp
bWUgd2hlbiB0aGUgZHJpdmVyIHdhcyBpbXBsZW1lbnRlZCwgYSBsYXJnZSBzZXQgb2YgVFZzL0hE
TUkgcGFuZWxzIHdlcmUKdGVzdGVkLCBhbmQgaXQgd2FzIHRoZSAnb3B0aW1hbCcgcGFyYW1ldGVy
IGZvdW5kLCBldmVuIGlmIHRoZSB2YWx1ZSBpcyBxdWl0ZQpyZXN0cmljdGl2ZS4KCkFzIE1heGlt
ZSBzYWlkIGVhcmxpZXIsIGl0IHdhcyBhbHNvIGVhc2llciB0byBpbXBsZW1lbnQgdGhpcyB0b2xl
cmFuY2UgZGlyZWN0bHkKd2l0aGluIHRoZSBEU0kgZHJpdmVyLCBzaW5jZSBvbmx5IHRoZSBkaXNw
bGF5LWNvbnRyb2xsZXIgYW5kIHRoZSBkcml2ZXIgaXRzZWxmCmhhdmUgYWNjZXNzIHRvIHRoaXMg
Y2xvY2suCgoKRXZlbnR1YWxseSBhIGRldmljZS10cmVlIHBhcmFtZXRlciBjb3VsZCBiZSBpbXBs
ZW1lbnRlZCwgd2l0aCBkZWZhdWx0IHZhbHVlIHRvCjUwSHosIHNvIHRoYXQgZmluZSB0dW5pbmcg
Y2FuIGJlIGRvbmUgdXNpbmcgb3RoZXIgYnJpZGdlcy4KCgpIb3BlIHRoaXMgYW5zd2VyIHRvIHlv
dXIgcXVlc3Rpb24uCgoKUmVnYXJkcywKClJhcGhhw6tsCgoKPiAvU2VhbgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=

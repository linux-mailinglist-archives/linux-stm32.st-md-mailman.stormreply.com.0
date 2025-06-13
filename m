Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D51AD8D93
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Jun 2025 15:47:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82601C36B36;
	Fri, 13 Jun 2025 13:47:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 749DBC36B19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jun 2025 13:47:41 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DB7mUP030978;
 Fri, 13 Jun 2025 15:47:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Ei9n0mlSS+RGTUs8J62IILpUrlBM4z2gov+FvU4IE2M=; b=e9zj3QmwZlRjxEsa
 fHopqr4SFaF+DVyvbsh6ITrsy/VLyJfB/NPjT41IAjlqgnu4EyQqZ3Iqg4g1JUr1
 mu2E7lrj/oolb6LwgSgR/fHxGB95CYTStre9MZP4ae93ZjiaXLZw4zC2VkY/rRCr
 kW/nDiLYqdaEhu3vruKyVxvSvp1ppHtBs41ExJxJMvJRUIcnsGRaOpwJcltTaqIc
 cRSzwr2VR3hW2I+U4+qTUKqDIneClB8VVZOZw4VWsJbkwORPLXSw7P4HXtEOpCSP
 YCZlb1U3rJaJcBOHfLuFtcxCQWoOT5pgLRq9fBh5DEHRHRfvVGs/3IPPkwHJy6WI
 mhJttA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cs364mg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Jun 2025 15:47:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2B8B04005A;
 Fri, 13 Jun 2025 15:46:31 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F05F2AE5D11;
 Fri, 13 Jun 2025 15:44:59 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 15:44:59 +0200
Received: from [10.252.9.77] (10.252.9.77) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 15:44:58 +0200
Message-ID: <c3208fec-53ac-46eb-907f-cc5b7a18b188@foss.st.com>
Date: Fri, 13 Jun 2025 15:44:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
References: <20250110091922.980627-1-fabrice.gasnier@foss.st.com>
 <20250110091922.980627-5-fabrice.gasnier@foss.st.com>
 <4b641513-ff2e-43ab-8074-ba6b521875e2@foss.st.com>
 <5ui74qlssllgn4h34by5jcpi5g6rknziclcsh4w27tjvznynsv@lcjtjxn6rovl>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <5ui74qlssllgn4h34by5jcpi5g6rknziclcsh4w27tjvznynsv@lcjtjxn6rovl>
X-Originating-IP: [10.252.9.77]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, catalin.marinas@arm.com, lee@kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, will@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org, wbg@kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 4/8] pwm: stm32: add support for
	stm32mp25
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

T24gNS8xNS8yNSAxMToyNCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gSGVsbG8gRmFicmlj
ZSwKPiAKPiBPbiBXZWQsIE1heSAxNCwgMjAyNSBhdCAxMTozMDoyNkFNICswMjAwLCBGYWJyaWNl
IEdhc25pZXIgd3JvdGU6Cj4+IE9uIDEvMTAvMjUgMTA6MTksIEZhYnJpY2UgR2FzbmllciB3cm90
ZToKPj4+IEFkZCBzdXBwb3J0IGZvciBTVE0zMk1QMjUgU29DLiBVc2UgbmV3bHkgaW50cm9kdWNl
ZCBjb21wYXRpYmxlIHRvIGhhbmRsZQo+Pj4gbmV3IGZlYXR1cmVzIGFsb25nIHdpdGggcmVnaXN0
ZXJzIGFuZCBiaXRzIGRpdmVyc2l0eS4KPj4+IFRoZSBNRkQgcGFydCBvZiB0aGUgZHJpdmVyIGZp
bGxzIGluIGlwaWRyLCBzbyBpdCBpcyB1c2VkIHRvIGNoZWNrIHRoZQo+Pj4gaGFyZHdhcmUgY29u
ZmlndXJhdGlvbiByZWdpc3Rlciwgd2hlbiBhdmFpbGFibGUgdG8gZ2F0aGVyIHRoZSBudW1iZXIK
Pj4+IG9mIFBXTSBjaGFubmVscyBhbmQgY29tcGxlbWVudGFyeSBvdXRwdXRzLgo+Pj4KPj4+IFNp
Z25lZC1vZmYtYnk6IEZhYnJpY2UgR2FzbmllciA8ZmFicmljZS5nYXNuaWVyQGZvc3Muc3QuY29t
Pgo+Pj4gLS0tCj4+PiBDaGFuZ2VzIGluIHYyOgo+Pj4gQWRkcmVzcyBVd2UgcmV2aWV3IGNvbW1l
bnRzOgo+Pj4gLSBNYWtlIE1BWF9QV01fT1VUUFVUIGRlZmluaXRpb24gbGVzcyBnZW5lcmljOiBT
VE0zMl9QV01fTUFYX09VVFBVVAo+Pj4gLSBObyBuZWVkIHRvIGluaXRpYWxpemUgJ25wd20nCj4+
PiAtIHJlZmFjdG9yIGNvZGUsIGZvciAqbnVtX2VuYWJsZWQgdG8gdXNlIHNhbWUgY29kZSBwYXRo
Cj4+PiAtLS0KPj4+ICBkcml2ZXJzL3B3bS9wd20tc3RtMzIuYyB8IDQyICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKystLS0tLS0tCj4+PiAgMSBmaWxlIGNoYW5nZWQsIDM1IGluc2Vy
dGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4+Cj4+IEhpIFV3ZSwKPj4KPj4gSSB0aGluayB0aGlz
IHBhdGNoIHN0aWxsIG1pc3Mgc29tZSByZXZpZXdzLgo+PiBUaGUgZmlyc3QgcGF0Y2hlcyBvZiB0
aGlzIHNlcmllcyBoYXZlIGJlZW4gbWVyZ2VkLgo+Pgo+PiBJcyBpdCBvayBmb3IgeW91IHRvIG1l
cmdlLCBvciBzaGFsbCBJIHJlc2VuZCBzZXBhcmF0ZWx5ID8KPiAKPiBJIGhhdmUgaXQgc3RpbGwg
b24gbXkgcmFkYXIsIG5vIG5lZWQgdG8gcmVzZW5kLiBJIGp1c3QgaGF2ZSB0byBmaW5kIHRoZQo+
IHRpbWUgdG8gbG9vayBpbnRvIGl0IGluIG1vcmUgZGV0YWlsLgoKSGVsbG8gVXdlLAoKR2VudGxl
IHJlbWluZGVyLCBJIGhvcGUgeW91IG1heSBmaW5kIHNvbWUgdGltZSB0byByZXZpZXcgdGhpcyBw
YXRjaCA/CgpCZXN0IFJlZ2FyZHMsCkZhYnJpY2UKCj4gCj4gQmVzdCByZWdhcmRzCj4gVXdlCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==

Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD498A51A0
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Apr 2024 15:38:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CF6AC6B444;
	Mon, 15 Apr 2024 13:38:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66036C69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 13:38:35 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43FAvxKD019795; Mon, 15 Apr 2024 15:38:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:subject:from:to:cc:date:in-reply-to:references
 :content-type:content-transfer-encoding:mime-version; s=
 selector1; bh=GOpywjy/f47DDDysRmWIO2J0xCC64iHGAOQIV8Qj7F8=; b=yO
 hZGQQcs0JCrB9Vu3qov1OfOnIOmxqQBmKC4yfedzFpzTpelm8breBeJ15EEr2iWH
 Bs0zBsY4RQTaUK8wIqdj3c9lQl4fPC5lhYUS552qxILUlYBsWQ8Znt1KocWqXxsd
 xqLYXvCuKruecAE03mqVqE1JhdBz9W1WjqkVb8urC4Nb7rzcq7StJ1nUn35dWMe1
 pl284g1xay3GC1J5aZw60MabS7mnvI5sMaqTudfHaY24GmdXDMQ3XlfupgQzTYEs
 SxiExgcgJsxMsibv97iBKwPN29G2u11tB1wAlCYvAGZYYeMEHg24QvAcARvd7a1P
 5X8+qL8NoOxGwk9Ifytg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xfhcwfup2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Apr 2024 15:38:04 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2AA584002D;
 Mon, 15 Apr 2024 15:37:59 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 94C75211F1E;
 Mon, 15 Apr 2024 15:37:13 +0200 (CEST)
Received: from [192.168.8.15] (10.48.86.102) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 15 Apr
 2024 15:37:12 +0200
Message-ID: <d92eaa433cd2403c4f3c3b7e49aa8dbf0b3e256e.camel@foss.st.com>
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Date: Mon, 15 Apr 2024 15:37:10 +0200
In-Reply-To: <87cyssa64a.ffs@tglx>
References: <20240216094758.916722-1-antonio.borneo@foss.st.com>
 <20240216094758.916722-3-antonio.borneo@foss.st.com> <87cyssa64a.ffs@tglx>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Originating-IP: [10.48.86.102]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-15_11,2024-04-15_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 02/12] dt-bindings: interrupt-controller:
 stm32-exti: Add irq nexus child node
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

T24gTW9uLCAyMDI0LTAyLTE5IGF0IDE1OjE5ICswMTAwLCBUaG9tYXMgR2xlaXhuZXIgd3JvdGU6
Cj4gT24gRnJpLCBGZWIgMTYgMjAyNCBhdCAxMDo0NywgQW50b25pbyBCb3JuZW8gd3JvdGU6Cj4g
PiBUaGUgbWFwcGluZyBvZiBFWFRJIGludGVycnVwdHMgdG8gaXRzIHBhcmVudCBpbnRlcnJ1cHQg
Y29udHJvbGxlcgo+ID4gaXMgYm90aCBTb0MgYW5kIGluc3RhbmNlIGRlcGVuZGVudC4KPiA+IFRo
ZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIHJlcXVpcmVzIGFkZGluZyBhIG5ldyB0YWJsZSB0byB0
aGUKPiA+IGRyaXZlcidzIGNvZGUgYW5kIGEgbmV3IGNvbXBhdGlibGUgZm9yIGVhY2ggbmV3IEVY
VEkgaW5zdGFuY2UuCj4gPiAKPiA+IEFkZCB0byB0aGUgYmluZGluZyBhbiBpbnRlcnJ1cHQgbmV4
dXMgY2hpbGQgbm9kZSB0aGF0IHdpbGwgYmUKPiA+IHVzZWQgb24gdGhlIG5ldyBFWFRJIGluc3Rh
bmNlcyBhbmQgY2FuIGJlIG9wdGlvbmFsbHkgdXNlZCBvbiB0aGUKPiA+IGV4aXN0aW5nIGluc3Rh
bmNlcy4KPiA+IFRoZSBwcm9wZXJ0eSAnaW50ZXJydXB0LW1hcCcgaW4gdGhlIG5leHVzIG5vZGUg
bWFwcyBlYWNoIEVYVEkKPiA+IGludGVycnVwdCB0byB0aGUgcGFyZW50IGludGVycnVwdC4KPiA+
IEFsaWduICNhZGRyZXNzLWNlbGxzIGFuZCAjaW50ZXJydXB0LWNlbGxzIGJldHdlZW4gdGhlIEVY
VEkgbm9kZQo+ID4gYW5kIGl0cyBuZXh1cyBub2RlLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBB
bnRvbmlvIEJvcm5lbyA8YW50b25pby5ib3JuZW9AZm9zcy5zdC5jb20+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBGYWJyaWNlIEdhc25pZXIgPGZhYnJpY2UuZ2FzbmllckBmb3NzLnN0LmNvbT4KPiAKPiBU
aGlzIFMtTy1CIGNoYWluIGlzIGJyb2tlbiBhcyBpdCBzdWdnZXN0cyB0aGF0IHlvdSB3cm90ZSB0
aGUgcGF0Y2ggYW5kCj4gRmFicmljZSByZWxheWVkIGl0Lgo+IAo+IGh0dHBzOi8vd3d3Lmtlcm5l
bC5vcmcvZG9jL2h0bWwvbGF0ZXN0L3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLmh0bWwjc2ln
bi15b3VyLXdvcmstdGhlLWRldmVsb3Blci1zLWNlcnRpZmljYXRlLW9mLW9yaWdpbgo+IAo+IEJ1
dCB0aGF0J3Mgbm90IHRoZSBjYXNlLiBJZiB5b3UgY28tZGV2ZWxvcGVkIHRoaXMgd2l0aCBGYWJy
aWNlIHRoZW4KPiBwbGVhc2UgdXNlIENvLWRldmVsb3BlZC1ieS4gU2VlOgo+IAo+IGh0dHBzOi8v
d3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvbGF0ZXN0L3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVz
Lmh0bWwjd2hlbi10by11c2UtYWNrZWQtYnktY2MtYW5kLWNvLWRldmVsb3BlZC1ieQo+IAo+IFRo
YW5rcywKPiAKPiDCoMKgwqDCoMKgwqDCoCB0Z2x4Cj4gCgpUaGFua3MgZm9yIHRoZSByZXZpZXcu
CkknbSBzZW5kaW5nIGEgVjIgYWRkcmVzc2luZyBhbGwgdGhlIHJlbWFya3MuCgpSZWdhcmRzLApB
bnRvbmlvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==

Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 755F6919B9B
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 02:13:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FD9FC6DD9F;
	Thu, 27 Jun 2024 00:13:18 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2BE4C5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 00:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=Y/oie4D7vMLSlRHkXYeX6gGQHuuqioTWp0KRoGukRbU=; b=XZ
 tqf9Kuz/yKkf10DqErr96j4qpNaXrG6wfrswfQTKClOJWAOlEk+QMrUF8m1SvxvkatiHXALRcL0BZ
 kPpvFe2dVK9sQswQ7K5ZossXeTx3U4ZaEYyMdru5FmZ5IWL6ENyIAS41oDK9ma92CDFn3Y3WtNYhG
 KAEhQ/ya3+VOXFE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sMckv-0015iQ-V6; Thu, 27 Jun 2024 02:12:53 +0200
Date: Thu, 27 Jun 2024 02:12:53 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Message-ID: <974114ca-98ed-44a7-a038-eb3f71bd03ef@lunn.ch>
References: <20240625-icc_bw_voting_from_ethqos-v2-0-eaa7cf9060f0@quicinc.com>
 <20240625-icc_bw_voting_from_ethqos-v2-2-eaa7cf9060f0@quicinc.com>
 <4123b96c-ae1e-4fdd-aab2-70478031c59a@lunn.ch>
 <81e97c36-e244-4e94-b752-b06334a06db0@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <81e97c36-e244-4e94-b752-b06334a06db0@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 kernel@quicinc.com, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Eric Dumazet <edumazet@google.com>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH v2 2/3] net: stmmac: Add interconnect
	support
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

T24gV2VkLCBKdW4gMjYsIDIwMjQgYXQgMDQ6MzY6MDZQTSAtMDcwMCwgU2FnYXIgQ2hlbHV2ZWdv
d2RhIHdyb3RlOgo+IAo+IAo+IE9uIDYvMjYvMjAyNCA2OjA3IEFNLCBBbmRyZXcgTHVubiB3cm90
ZToKPiA+PiArCXBsYXQtPmF4aV9pY2NfcGF0aCA9IGRldm1fb2ZfaWNjX2dldCgmcGRldi0+ZGV2
LCAiYXhpIik7Cj4gPj4gKwlpZiAoSVNfRVJSKHBsYXQtPmF4aV9pY2NfcGF0aCkpIHsKPiA+PiAr
CQlyZXQgPSAodm9pZCAqKXBsYXQtPmF4aV9pY2NfcGF0aDsKPiA+IAo+ID4gQ2FzdGluZwl0byBh
IHZvaWQgKiBzZWVtcyBvZGQuIEVSUl9QVFIoKT8KPiA+IAo+ID4gCUFuZHJldwo+IAo+IFRoZSBv
dXRwdXQgb2YgZGV2bV9vZl9pY2NfZ2V0IGlzIGEgcG9pbnRlciBvZiB0eXBlIGljY19wYXRoLAo+
IGkgYW0gZ2V0dGluZyBiZWxvdyB3YXJuaW5nIHdoZW4gaSB0cnkgdG8gRVJSX1BUUiBpbnN0ZWFk
IG9mIFZvaWQqCj4gYXMgRVJSX1BUUiB3aWxsIHRyeSB0byBjb252ZXJ0IGEgbG9uZyBpbnRlZ2Vy
IHRvIGEgVm9pZCouCj4gCj4gIndhcm5pbmc6IHBhc3NpbmcgYXJndW1lbnQgMSBvZiDigJhFUlJf
UFRS4oCZIG1ha2VzIGludGVnZXIgZnJvbSBwb2ludGVyIHdpdGhvdXQgYSBjYXN0Igo+IAoKaHR0
cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTAtcmM1L3NvdXJjZS9kcml2ZXJzL2Ny
eXB0by9xY2UvY29yZS5jI0wyMjQKaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYu
MTAtcmM1L3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hM3h4X2dwdS5jI0w1OTEK
aHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTAtcmM1L3NvdXJjZS9kcml2ZXJz
L2dwdS9kcm0vbXNtL2FkcmVuby9hM3h4X2dwdS5jI0w1OTcKaHR0cHM6Ly9lbGl4aXIuYm9vdGxp
bi5jb20vbGludXgvdjYuMTAtcmM1L3NvdXJjZS9kcml2ZXJzL3NwaS9zcGktcXVwLmMjTDEwNTIK
ClNvcnJ5LCBQVFJfRVJSKCkuCgpJbiBnZW5lcmFsLCBhIGNhc3QgdG8gYSB2b2lkICogaXMgYSBy
ZWQgZmxhZyBhbmQgd2lsbCBnZXQgbG9va2VkCmF0LiBJdCBpcyBnZW5lcmFsbHkgd3JvbmcuIFNv
IHlvdSBtaWdodCB3YW50IHRvIGZpeHVwIHdoZXJlIGV2ZXIgeW91CmNvcGllZCB0aGlzIGZyb20u
CgoJQW5kcmV3Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==

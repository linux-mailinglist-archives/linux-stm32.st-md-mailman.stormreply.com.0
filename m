Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2E5710AEE
	for <lists+linux-stm32@lfdr.de>; Thu, 25 May 2023 13:31:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01B61C6A61A;
	Thu, 25 May 2023 11:31:00 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A929C04B10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 May 2023 11:30:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D6AE164503;
 Thu, 25 May 2023 11:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F37DC4339B;
 Thu, 25 May 2023 11:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685014257;
 bh=WuDnzx0mN7mNBgU7tsgoEX4DNhtKyDb/OxubW6VyA0U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GC+ljHC8H2Iux5AZ0GremU5o0Eby4zu6UKKSgNyfTjIWSXgLjXrQrHe/ZBENSdmmB
 rpjFZV7JHHSX4YXl69iH+LCnz+zJjiWyZsi4gcUrfqqj6Lsr+e8lqUfoJjoNAakTps
 ljuQitF4E2r+WIbyJeA2Nh2SzaZjOqCv74oCvYK0m4uf52VeziYlfzc6M5fNWpP2Fe
 Xap4H/8ymCI6J8X54VvkxRvbw/Ubgi+7kF8jut2nUz1Jpb8jvyX3C7v5769Y+oMh8k
 jxFYEeFD3JRntRv8w/pp92/5vkjCRxKCD/W9a+zg8JxGOp2X8wg8HZzO8C3Ou9n9sE
 o6ly+cQMgxEEA==
Date: Thu, 25 May 2023 12:30:52 +0100
From: Lee Jones <lee@kernel.org>
To: p.paillet@foss.st.com
Message-ID: <20230525113052.GC423913@google.com>
References: <20230523074206.201962-1-p.paillet@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230523074206.201962-1-p.paillet@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: mfd: add vref_ddr supply for
	STPMIC1
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

T24gVHVlLCAyMyBNYXkgMjAyMywgcC5wYWlsbGV0QGZvc3Muc3QuY29tIHdyb3RlOgoKPiBGcm9t
OiBQYXNjYWwgUGFpbGxldCA8cC5wYWlsbGV0QGZvc3Muc3QuY29tPgo+IAo+IEFkZCB2cmVmX2Rk
ciBzdXBwbHkgZGVzY3JpcHRpb24gZm9yIHRoZSBTVFBNSUMxLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFBhc2NhbCBQYWlsbGV0IDxwLnBhaWxsZXRAZm9zcy5zdC5jb20+Cj4gLS0tCj4gIERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvc3Qsc3RwbWljMS55YW1sIHwgMiArLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCkFwcGxpZWQsIHRo
YW5rcwoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=

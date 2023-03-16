Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEEE6BD462
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Mar 2023 16:53:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11665C65043;
	Thu, 16 Mar 2023 15:53:42 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C29CC035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 15:53:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EAE41B81F9A;
 Thu, 16 Mar 2023 15:53:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DAA5C433D2;
 Thu, 16 Mar 2023 15:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678982019;
 bh=Rj/V4HvM4lftSD7pR5Qhs+36gJgM/NfzJd5glSkQr/s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YIGG2QuV9M6wru4NUwa7EWkLGPBulz674i9mA5XOCE2CmTJ9uGsMePf+3NiFEKUof
 GKxNtKYUhHmtHzmLkjHnv2cFxHtSOyaHSM/HpxF3HfVYU6l1ZgceT4hRjDKcc1cMZX
 VCt70267hChSrXRbxqOvPKi75pPEcf2y1rgwCHZ81OIucGW56DqAL5zqMMF9OfQ3KP
 Be8pEZHxzFjGeq/heU9OwWJJhqPFEuMh3dyn9CcIs6tYLXnDe3bvp8hz4TX+t3R8JI
 nPmnIoub6qTFr45Q49rvmk/mypxAack4lCR7Fw4oAeJP2eDAoqN/MqPfX2plt/R0K8
 Upu0a5Emv/UMA==
Date: Thu, 16 Mar 2023 15:53:33 +0000
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <20230316155333.GL9667@google.com>
References: <20230310144712.1543379-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230310144712.1543379-1-robh@kernel.org>
X-Topics: 
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>,
 devicetree@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
 linux-kernel@vger.kernel.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-rpi-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] mfd: Use of_property_present() for
 testing DT property presence
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

T24gRnJpLCAxMCBNYXIgMjAyMywgUm9iIEhlcnJpbmcgd3JvdGU6Cgo+IEl0IGlzIHByZWZlcnJl
ZCB0byB1c2UgdHlwZWQgcHJvcGVydHkgYWNjZXNzIGZ1bmN0aW9ucyAoaS5lLgo+IG9mX3Byb3Bl
cnR5X3JlYWRfPHR5cGU+IGZ1bmN0aW9ucykgcmF0aGVyIHRoYW4gbG93LWxldmVsCj4gb2ZfZ2V0
X3Byb3BlcnR5L29mX2ZpbmRfcHJvcGVydHkgZnVuY3Rpb25zIGZvciByZWFkaW5nIHByb3BlcnRp
ZXMuIEFzCj4gcGFydCBvZiB0aGlzLCBjb252ZXJ0IG9mX2dldF9wcm9wZXJ0eS9vZl9maW5kX3By
b3BlcnR5IGNhbGxzIHRvIHRoZQo+IHJlY2VudGx5IGFkZGVkIG9mX3Byb3BlcnR5X3ByZXNlbnQo
KSBoZWxwZXIgd2hlbiB3ZSBqdXN0IHdhbnQgdG8gdGVzdAo+IGZvciBwcmVzZW5jZSBvZiBhIHBy
b3BlcnR5IGFuZCBub3RoaW5nIG1vcmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8
cm9iaEBrZXJuZWwub3JnPgo+IC0tLQo+ICBkcml2ZXJzL21mZC9iY20yODM1LXBtLmMgfCAyICst
Cj4gIGRyaXZlcnMvbWZkL2toYWRhcy1tY3UuYyB8IDIgKy0KPiAgZHJpdmVycy9tZmQvc3RtcGUu
YyAgICAgIHwgMiArLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKCkFwcGxpZWQsIHRoYW5rcwoKLS0KTGVlIEpvbmVzIFvmnY7nkLzmlq9dCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==

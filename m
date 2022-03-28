Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 555514EA7E6
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Mar 2022 08:33:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBD0DC5F1FB;
	Tue, 29 Mar 2022 06:32:59 +0000 (UTC)
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91858C57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Mar 2022 13:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1648475436;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=4ezCWy705CocHbi8RdHxAqN8vv3gv5SFt/Dzp2Yq4pw=;
 b=h67cVVRQQY22Ho6Oj4lqPV6bbZckg/sqlHJTvISuhhitSpD81WickIMTAt5h0AFRCu
 Qg+4KMYijDSN2sgiXaUl4mkWwL9szWD4xXIJNJkYGv3z88l0PTuJb0dZ/VHDeEbmgBID
 CBrquT4GkxLKaOV2BIp8osnHX+l3cX0/OHzhwCQzswvxR4LPQN6v+l5jOK8elenecZim
 yxdVkybdH/gWZLIWfRewxjT6C6qAdZGJSpqqZf7tPJGeXqzB/cGuyUHgPrRZx7Uc2aQt
 y0IhuWC0oSbH7Z+AuXQhtPgu/MgbvE1jvg6fxo79GX5ZqOVxt5WvtyeuH2CF7eSsjLBB
 +nnw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw43u32M="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.42.1 DYNA|AUTH)
 with ESMTPSA id u3e945y2SDoZ3IR
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Mon, 28 Mar 2022 15:50:35 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <YkG2RPrtPaBNXb7a@latitude>
Date: Mon, 28 Mar 2022 15:50:34 +0200
Message-Id: <D9AFAC3C-46CA-4C40-8559-FD6934411CAB@goldelico.com>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <YkG2RPrtPaBNXb7a@latitude>
To: =?utf-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Ansuel Smith <ansuelsmth@gmail.com>
X-Mailer: Apple Mail (2.3445.104.21)
X-Mailman-Approved-At: Tue, 29 Mar 2022 06:32:58 +0000
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev,
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-unisoc@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-renesas-soc@vger.kernel.org,
 kernel@dh-electronics.com, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-oxnas@groups.io
Subject: Re: [Linux-stm32] [RFC PATCH 0/1] Categorize ARM dts directory
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

Cgo+IEFtIDI4LjAzLjIwMjIgdW0gMTU6MjEgc2NocmllYiBKb25hdGhhbiBOZXVzY2jDpGZlciA8
ai5uZXVzY2hhZWZlckBnbXgubmV0PjoKPiAKPiBPciBtYXliZSBiY20gaW5zdGVhZCBvZiBicm9h
ZGNvbS4gTm90IHN1cmUgd2hpY2ggaXMgcHJlZmVycmVkIGJ5Cj4gQnJvYWRjb20gcGVvcGxlLgoK
TWF5YmUgaXQgc2hvdWxkIGFsd2F5cyBmb2xsb3cgdGhlIGxpc3Qgb2YgdmVuZG9yIHByZWZpeGVz
IGFzIHdlIGFyZSB0YWxraW5nIGFib3V0IERUUz8KCmp1c3QgbXkgMmN0cywKTmlrb2xhdXMKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==

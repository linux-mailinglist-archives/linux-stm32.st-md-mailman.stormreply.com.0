Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0899EE864
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2019 20:31:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 892ABC36B0B;
	Mon,  4 Nov 2019 19:31:35 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71DECC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Nov 2019 19:31:34 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:1e2::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 108EC151D4FBA;
 Mon,  4 Nov 2019 11:31:32 -0800 (PST)
Date: Mon, 04 Nov 2019 11:31:31 -0800 (PST)
Message-Id: <20191104.113131.1498438752773891509.davem@davemloft.net>
To: christophe.roullier@st.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20191104105100.4288-1-christophe.roullier@st.com>
References: <20191104105100.4288-1-christophe.roullier@st.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Mon, 04 Nov 2019 11:31:32 -0800 (PST)
Cc: mark.rutland@arm.com, robh@kernel.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 andrew@lunn.ch, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V2 1/1] net: ethernet: stmmac: drop unused
 variable in stm32mp1_set_mode()
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
Content-Type: text/plain; charset="iso8859-7"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

RnJvbTogQ2hyaXN0b3BoZSBSb3VsbGllciA8Y2hyaXN0b3BoZS5yb3VsbGllckBzdC5jb20+DQpE
YXRlOiBNb24sIDQgTm92IDIwMTkgMTE6NTE6MDAgKzAxMDANCg0KPiBCdWlsZGluZyB3aXRoIFc9
MSAoY2Yuc2NyaXB0cy9NYWtlZmlsZS5leHRyYXdhcm4pIG91dHB1dHM6DQo+IHdhcm5pbmc6IHZh
cmlhYmxlIKFyZXSiIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVd
DQo+IA0KPiBEcm9wIHRoZSB1bnVzZWQgJ3JldCcgdmFyaWFibGUuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RvcGhlIFJvdWxsaWVyIDxjaHJpc3RvcGhlLnJvdWxsaWVyQHN0LmNvbT4NCg0K
QXBwbGllZCB0byBuZXQtbmV4dC4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==

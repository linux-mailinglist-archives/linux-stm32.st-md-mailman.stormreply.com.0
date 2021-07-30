Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F193DD338
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Aug 2021 11:44:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE708C5A4E3;
	Mon,  2 Aug 2021 09:44:40 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 (using TLSv1.2 with cipher DHE-RSA-SEED-SHA (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8931C57B6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Jul 2021 14:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=795; q=dns/txt; s=iport;
 t=1627656514; x=1628866114;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=n3PkM/+InBuHzKFjtN6VP5Z6K9yetavVDut1DYLO1yY=;
 b=GaXjf1epBtd1HnTsagrEGjG58G2YFum4ImwgBK61Bi9DTP5EiAqpBpH4
 x4FM74NMtsXQF2Xa8Cqtk1+lLpMzwooDhgxJd7b67O4RVNhTqRcTSPP+F
 Oeu5CF+ETt3e9K8vBrUmq6Qt1w0W/fWxlTo5Y9l7Z//bF1i8DOV3BZagd A=;
X-IronPort-AV: E=Sophos;i="5.84,282,1620691200"; d="scan'208";a="915063875"
Received: from rcdn-core-5.cisco.com ([173.37.93.156])
 by rcdn-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 30 Jul 2021 14:48:32 +0000
Received: from zorba ([10.24.25.85])
 by rcdn-core-5.cisco.com (8.15.2/8.15.2) with ESMTPS id 16UEmUWR021352
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 30 Jul 2021 14:48:32 GMT
Date: Fri, 30 Jul 2021 07:48:30 -0700
From: Daniel Walker <danielwa@cisco.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <20210730144830.GO1633923@zorba>
References: <20210729234443.1713722-1-danielwa@cisco.com>
 <YQNrmB9XHkcGy5D0@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YQNrmB9XHkcGy5D0@lunn.ch>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.25.85, [10.24.25.85]
X-Outbound-Node: rcdn-core-5.cisco.com
X-Mailman-Approved-At: Mon, 02 Aug 2021 09:44:20 +0000
Cc: Balamurugan Selvarajan <balamsel@cisco.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Russell King <linux@armlinux.org.uk>, Jakub Kicinski <kuba@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xe-linux-external@cisco.com, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC-PATCH] net: stmmac: Add KR port support.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Fri, Jul 30, 2021 at 05:01:44AM +0200, Andrew Lunn wrote:
> On Thu, Jul 29, 2021 at 04:44:42PM -0700, Daniel Walker wrote:
> > From: Balamurugan Selvarajan <balamsel@cisco.com>
> > 
> > For KR port the mii interface is a chip-to-chip
> > interface without a mechanical connector. So PHY
> > inits are not applicable. In this case MAC is
> > configured to operate at forced speed(1000Mbps)
> > and full duplex. Modified driver to accommodate
> > PHY and NON-PHY mode.
> 
> I agree with Florian here. Look at all the in kernel examples of a SoC
> MAC connected to an Ethernet switch. Some use rgmii, others 1000BaseX
> or higher. But they all follow the same scheme, and don't need
> invasive MAC driver changes.


Can you provide the examples which you looked at ?

Daniel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

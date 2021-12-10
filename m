Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C83047011D
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Dec 2021 14:01:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9509DC5F1EE;
	Fri, 10 Dec 2021 13:01:36 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C72F6C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Dec 2021 11:57:43 +0000 (UTC)
Date: Fri, 10 Dec 2021 12:57:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1639137463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e1vgqxQf/HEi/380wsVHeIa9ywtiqHCGTo+cLrBRCS8=;
 b=M06WG2fjZg8Q7s/v74qppLMukNLwKMvoskcPaBE+u0RABP+0hnmX1ucoBrvIcdc2ONks3i
 xZE6b5nRkbka6yd8uj6I5EyaY6fh2d4xuSmoCGI9mBYeiyY1PmdQCOtu7EDJbZXiea2rrM
 vdcfjawEaBaRyLWeF/E7Hg/hlAoDZnyh304ebFxSlPKzlyQA1fIZZSol8a8Y1Y4BPxpPYm
 k6ulRdzVbUJgYaTenybJ5jI4LH7+NRH4/oJMFn7B9dCGilW8iPh6+u9K/Q7c4bng4Zz1C0
 VhIuhmuZGMqq2gMBAbDmoGtlhwtI+u2nF6dosyq4Nhqp8Uc3vrOWussg4eWwNg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1639137463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e1vgqxQf/HEi/380wsVHeIa9ywtiqHCGTo+cLrBRCS8=;
 b=rsc5nRk9sbKctQ/ZB7AeRdGtNr25bxJmH09axXoE00yDptL0jMq7ZL992/bFEo7MIiqUsc
 2ysWQSGF6MWYVgCQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Kurt Kanzenbach <kurt.kanzenbach@linutronix.de>
Message-ID: <YbNAtugLvd83zP2W@linutronix.de>
References: <20211209151631.138326-1-boon.leong.ong@intel.com>
 <20211209151631.138326-3-boon.leong.ong@intel.com>
 <87fsr0zs77.fsf@kurt>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87fsr0zs77.fsf@kurt>
X-Mailman-Approved-At: Fri, 10 Dec 2021 13:01:35 +0000
Cc: Alexandre Torgue <alexandre.torgue@st.com>, netdev@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: add tc flower
 filter for EtherType matching
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

On 2021-12-10 11:10:04 [+0100], Kurt Kanzenbach wrote:
> > +	if (match.mask->n_proto) {
> > +		__be16 etype = ntohs(match.key->n_proto);
> 
> n_proto is be16. The ntohs() call will produce an u16.

While at it, could we be please remove that __force in
ETHER_TYPE_FULL_MASK and use cpu_to_be16() macro?

> Thanks,
> Kurt

Sebastian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

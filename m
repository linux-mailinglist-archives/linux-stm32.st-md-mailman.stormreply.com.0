Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D06A49F347F
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Dec 2024 16:29:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7EFAEC7129D;
	Mon, 16 Dec 2024 15:29:34 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA1A9C6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Dec 2024 15:29:27 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1734362967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4jyxZIT7hjcGmYBbGvCunP4BvQnpd8I0TAlvuGu43Q8=;
 b=to0flyVGfWlzOZWr3Z6Tb8o0KM9VZYaYTMoWk1PyFqyVqeIDLY8fObSndBOcgUfBXaKNeb
 vP2Vyq/J8Wj9JHL6+t0NUjA5f1fxGik9NFWG/kamlnAduJ9JV8pZoBNYwzexQzLNzsnieM
 TH3VEl9Pv4cqaNuW+V68OpMdrYo/gqY+CoYmVqO1n83UujpkpdXQBNC5ObnaQGJNilgXj5
 TQP7zRs3oW9N7zzjcQ3Nbj9dEJNNvdeXBlg5Iu6QiM5M00c9igDkpLJtsjciwmaz6WCVL1
 kkIKgRczHsF7Uuj3qYBNrXy24Gg1SvHB/HWWSLgj8XmIJsRiGG1tiLqm8xCflw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1734362967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4jyxZIT7hjcGmYBbGvCunP4BvQnpd8I0TAlvuGu43Q8=;
 b=+e/NOM79ib7YYesHijkeiPijn+iT/nNF9l4lyNo83zLlfRsY57oIayxU55KSgHDNsmPEgr
 zFhHEOzAUjAx/mDA==
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20241216145323.111612-1-ben.wolsieffer@hefring.com>
References: <20241216145323.111612-1-ben.wolsieffer@hefring.com>
Date: Mon, 16 Dec 2024 16:35:26 +0106
Message-ID: <84cyhrk5nt.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jiri Slaby <jirislaby@kernel.org>,
 Ben Wolsieffer <ben.wolsieffer@hefring.com>
Subject: Re: [Linux-stm32] [PATCH] serial: stm32: use port lock wrappers for
	break control
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

On 2024-12-16, Ben Wolsieffer <ben.wolsieffer@hefring.com> wrote:
> Commit 30e945861f3b ("serial: stm32: add support for break control")
> added another usage of the port lock, but was merged on the same day as
> c5d06662551c ("serial: stm32: Use port lock wrappers"), therefore the
> latter did not update this usage to use the port lock wrappers.
>
> Fixes: c5d06662551c ("serial: stm32: Use port lock wrappers")
> Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>

Thanks for catching this!

Reviewed-by: John Ogness <john.ogness@linutronix.de>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

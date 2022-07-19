Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F63858694B
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Aug 2022 14:00:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 555F1C640FD;
	Mon,  1 Aug 2022 12:00:12 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4474EC03FDB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Jul 2022 13:35:31 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1658237730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZnYq6kN6bZRw+gZhQTcxVE6Zaw22X085XwpGGsnc0LI=;
 b=CyQEYGGv+AFbgFIFSVpPcaxfJX/ngoVpor7h4qInTeMHbdY8wjllGC2ysdiEZclzyA+6QX
 Elao6wEKx4pcSrnnbacxDhULrLTPELo6o/9D+IPZ4dIuoBg+8/UCE+mphJPAM19IAjy3Bc
 al78C74Y4QHVf+JMdKgaOklGX+GP3OEtG/gPT4EutfX7KFHDdtsxo0n7y4j9zAMty0P5CE
 +nfmz8TLMWlIcd0c401mUO9uyZueho9zQCd5yVim691NlfKgmW2qVdTn4At8sdzxN4H30i
 ccv9F1G2/Mr71Ih6WdAqPBp5rNbWCs0tslowBgtqijlsLmWVUdkTP3Nd1GAb8A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1658237730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZnYq6kN6bZRw+gZhQTcxVE6Zaw22X085XwpGGsnc0LI=;
 b=Hvbtsovu3CPZLdEdwIuCVOFYPLOXESjdnVO+pH3Y64lU7v6N4Qr3K9QNomxJsuJ7WDer8p
 qkq2+myhCwm4f7Cg==
To: Petr Mladek <pmladek@suse.com>, Jan Kiszka <jan.kiszka@siemens.com>,
 Kieran Bingham <kbingham@kernel.org>
In-Reply-To: <20220719122831.19890-1-pmladek@suse.com>
References: <20220719122831.19890-1-pmladek@suse.com>
Date: Tue, 19 Jul 2022 15:41:30 +0206
Message-ID: <878ropw7h9.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 01 Aug 2022 12:00:10 +0000
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] scripts/gdb: fix 'lx-dmesg' on 32 bits
	arch
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

On 2022-07-19, Petr Mladek <pmladek@suse.com> wrote:
> From: Antonio Borneo <antonio.borneo@foss.st.com>
>
...
>
> Query the really used atomic_long_t counter type size.
>
> Fixes: e60768311af8 ("scripts/gdb: update for lockless printk ringbuffer")
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> [pmladek@suse.com: Query the really used atomic_long_t counter type size]
> Tested-by: Antonio Borneo <antonio.borneo@foss.st.com>
> Link: https://lore.kernel.org/r/20220617143758.137307-1-antonio.borneo@foss.st.com

Reviewed-by: John Ogness <john.ogness@linutronix.de>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

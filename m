Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F07D2CEE3
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Jan 2026 08:08:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE152C8F29E;
	Fri, 16 Jan 2026 07:08:31 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E42BC0693F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jan 2026 12:24:43 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-430f57cd471so530313f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jan 2026 04:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768479883; x=1769084683;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jS491F7pY/6VV44vwrzsFaAyA9RjAqjEAkamZCNInAE=;
 b=Ed+g/+e4z51PmhoBEdk9H/4tBmljM46HnPB6ZPZ6B/WjC01JlDWqa9Ava0U29ZiSWq
 dLxw+68E1HnGj9Khkx2kUnGqIaVr2uCl4CajN85jeXCSWiMBHQ26jc/UpfR+nRHHbnWu
 +f+EDrhFfZ8m3/V03iBsJu9aN/2XZLN0HqfV5Fn8L7WnJRy1wkZ5PX44Olse1UGxtFMa
 MCVVNAv1YPVi16/aUYJS2MrJHgRuZVxdFdYtpSFF1hAPTbi7OGxXrxZZxVaiXhCG5OJE
 hFly7Taznq4VnujR+hvbmL008QQU7XIdjhApi5xdd7pDR0pjjmLrjaOsnYa31R5FmuuU
 yWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768479883; x=1769084683;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jS491F7pY/6VV44vwrzsFaAyA9RjAqjEAkamZCNInAE=;
 b=g+4JMMDed6CkvUJd9lJhCy4uHdzoFpqCp0rWAy41hcgWUhwyve6z2knVKoia6vDNBO
 ouFc4bfvQrH/jnUb31Z8td2kiS8p/n4onbyyiu+lqIInRKs2RlOERW+D56zwcfiUAPfh
 8dfvHL/hMrPXTzQmpZaGatZ3dlLmznJb9eo+sDhO98LRvpp/VVw0o+LRKZMKoKjaqKw9
 3fN0wNMlpzWQJMoUTzt7EDsM/Yz0X6x6ZfS1a5vzUAhlhRWrB+FpEJAxti0q5biB3wIT
 7kEI0ByT9t18ZoeKKv+oWXKrlEtdHGTjLeSSrhHDbKMgV65cYBZnC+x+rTZWbnCVoYsH
 USYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9C2bu/GAszs6HMf6p3S4OFZsFLablaoSZ64KA4vFkqmIEcvXEGJj9QUQGCXSW3Cgm6DBV2IanRwjKlQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxK26nKl7vfMSgPPa3x/bCTL2B7WXtXUa/FnX0p/v1wRvFlrvdF
 ubgd2FfII8Fl/P2y7uOCLONjm93CdFMRLH6swujRi0QkYwdHNWkqrKEbhcLFhvT/Mgg=
X-Gm-Gg: AY/fxX5Aca8y09leUxzOc95+ryFzJ+Q7jnf4lKEQCsg/yiZ0TnBPF6SRLINiANHLV2q
 +HKAdtqgm+R4lB7qpwS4vEqh0WsieiEhpuU9Z2c/vww7c4VeF/iMqxLIrEU+KHARfkVNA+/FfYJ
 Revhoov1jp3Fvuvp84BYWa3imEU4DgZOTG+ubWLm5cmcgjVd2c4+2avlkv16CNZqStJ1VDcf6Eu
 ts8s+taXQ2B10sIQcK1KWm31mB8pU89CXKdweCcpc0AviZSd1FdxPneL+tNe36wEoGntQbQe06R
 mr3gxT2L9DbH56au6FeSVCGg6tuMGzd+MItX/PCs+Gw4SlxtaNExA3Uy7+drB+GK1f3Mxb/c9yn
 yOxSfkwq+FDHkzvzMU314IMACUKkDm+PnngY/m++sQVB3DPHLIrZ9kt6MFnz9xFmRqMH7IYwwM0
 o0yUVrBNRKhIWMEQ==
X-Received: by 2002:a05:6000:1789:b0:432:5c43:64 with SMTP id
 ffacd0b85a97d-4342c547aa9mr7495008f8f.41.1768479882771; 
 Thu, 15 Jan 2026 04:24:42 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-434af64a650sm5653238f8f.4.2026.01.15.04.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 04:24:42 -0800 (PST)
Date: Thu, 15 Jan 2026 13:24:39 +0100
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aWjch-EcYm7tkF0t@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-13-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-13-21a291bcf197@suse.com>
X-Mailman-Approved-At: Fri, 16 Jan 2026 07:08:29 +0000
Cc: Andreas Larsson <andreas@gaisler.com>, Kees Cook <kees@kernel.org>,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Shan-Chun Hung <schung@nuvoton.com>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Breno Leitao <leitao@debian.org>, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, sparclinux@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Richard Weinberger <richard@nod.at>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-serial@vger.kernel.org,
 Daniel Thompson <danielt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jacky Huang <ychuang3@nuvoton.com>, John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, linux-m68k@lists.linux-m68k.org,
 Nicholas Piggin <npiggin@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>, linux-fsdevel@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, linux-hardening@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 13/19] um: drivers: mconsole_kern.c:
 Migrate to register_console_force helper
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

On Sat 2025-12-27 09:16:20, Marcos Paulo de Souza wrote:
> The register_console_force function was introduced to register consoles
> even on the presence of default consoles, replacing the CON_ENABLE flag
> that was forcing the same behavior.
> 
> No functional changes.
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>

LGTM, nice cleanup!

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

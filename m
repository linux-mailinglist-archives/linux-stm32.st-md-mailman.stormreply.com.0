Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71858D2CED3
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Jan 2026 08:08:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11350C8F28E;
	Fri, 16 Jan 2026 07:08:31 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 253EDC8F274
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jan 2026 10:16:36 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-47ee2715254so3279435e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jan 2026 02:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768472195; x=1769076995;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zwLrvsF0GMvPSCBeAjAWQZcmbWMJVYh05GZu4CqMmyk=;
 b=TF9tpKTMMWxRuGevDP3Bbx0dpGys89CPFIfpGsaJNxXjDLPdLF8/S6jr5HLg3eZ3Pg
 3FXkZ9TLV57mlAVtqsfc05jzCMApWPmiqE1xRr5hkssrPVB8mvQs3JkHwtJrhHfMTP4d
 /MLxz2BgQONRTDyGdiXqmtC+8ieP6LlWNSIx3MhIpCKM2yeojIVovOduxfqmVkltLMJN
 wdaSmVYcyTOu8KbIj9nzG5w5hduuXL2iaBRLrWCbT+Te2MIhEj7LQdNCXRDgJnmR83v5
 W0/48NuTesyB9uvYw2I9AYWULmRWYZ74b0FBgwhcpOWI1B5sENn1wlleaDmtzYVrRP9N
 /yzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768472195; x=1769076995;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zwLrvsF0GMvPSCBeAjAWQZcmbWMJVYh05GZu4CqMmyk=;
 b=B1yk12L9cRbgmF2O82SbuLbO0oDaunXNyj5omRWhqHuHPZycyOGNBWmm3VgtrBkItK
 +W3AXtPcKXafd2HJ5pDGj9lFOKRpFaTFqwKZyU5GQooWl0EX+px2HnVlfPTEtR0vTaSg
 X8NM7eBN4NFFRudSgf+Q2vNeDaTglvzPfiBAFRifbnF1peINUGwxVpxFK+jcxkMIk/cP
 92DCu0idgZsSxIVwCSVHANAn02e9rAlrvvyxYVdMH8EfKqML38f2DcNvR625NVjzt1GO
 Qf+0v1KG0dpodgEcTafS+E1sO/O5SeyfoiG295/2A8i8gUIt7oG2seWdm4itM4tnw3no
 d5CQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkUWoeyCNgR5OtCzAE9mLJF7SKUXa91YME7VJMgXlyhUD36GFHel2RVU+Q/7xuw/hflAfbjRDogZw0Tw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzzfaCejgZJ6GfDox7OV+l/x+4t7/xw3S2X95dzdOPdU1pNoO2k
 u6Rwy8MlduogRmFgfA87s8udUJ8nYUe6d3NQIg0xv87JDr0ZQOvnOQX/EQPhDOJlmmM=
X-Gm-Gg: AY/fxX5FObwxWjRHgzlRtVxJ/IGUqi2gVzmyqWK6IexXYyN41LaE6bbe/+4QQyWt396
 5jLRra+55sNV43K8IDtf1jsS4fEHC9RRuKua1HNO2rMgBCyqUF/HGVD55Wmm2I4N4aj1sszhjgn
 TqxbKl/eXlItqb97obTHEBfAfjbxXMHZBlNuGHGpGR7TnIutk5qTpDQHuIiPy85OhLOpGHhsc5O
 VCBD4CRvkrfxWOyUQpY2kHdrKfPog/2SvLbn5i3tJ0XvwxueLaAC6k74qH1BKXCTeNUv73zPaj5
 6h8dbPIl1XYAsEpM/tcHc3n1iNPpSrTrGgNifgbTwt1SJ/hOBSjcR/0wgv+U2lpqcYdj/SBNawN
 RUNVOD1x6I7gQRtmuvPYKC1uRiobjAE9FpOST4Jazi8DUvvYSv7MJ1khZAYFOB4RH9Xdbo9l2sI
 zc2AGYZ4NSKW2riptb6ZCHrPXl
X-Received: by 2002:a05:600c:608c:b0:477:a246:8398 with SMTP id
 5b1f17b1804b1-47ee32e0829mr58296485e9.2.1768472195426; 
 Thu, 15 Jan 2026 02:16:35 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ee28144aasm39739585e9.11.2026.01.15.02.16.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 02:16:34 -0800 (PST)
Date: Thu, 15 Jan 2026 11:16:31 +0100
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aWi-f9LBJtxGWgWs@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-7-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-7-21a291bcf197@suse.com>
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
Subject: Re: [Linux-stm32] [PATCH 07/19] drivers: netconsole: Migrate to
 register_console_force helper
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

On Sat 2025-12-27 09:16:14, Marcos Paulo de Souza wrote:
> The register_console_force function was introduced to register consoles
> even on the presence of default consoles, replacing the CON_ENABLE flag
> that was forcing the same behavior.

I would add "No functional changes." like you did in the other
similar patches ;-)

> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>

Nice clean up!

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

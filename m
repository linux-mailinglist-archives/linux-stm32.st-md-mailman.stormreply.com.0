Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CLgDvxssWlVvAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2026 14:24:12 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D192646EA
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2026 14:24:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D32BC8F26C;
	Wed, 11 Mar 2026 13:24:11 +0000 (UTC)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com
 [209.85.221.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79064C055F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Mar 2026 13:24:09 +0000 (UTC)
Received: by mail-vk1-f175.google.com with SMTP id
 71dfb90a1353d-56ae58f3fc6so6637451e0c.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Mar 2026 06:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773235448; x=1773840248;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=34DR94e/1PAvLLEaib58vFA4GW0m5SGe6jvxchEhMek=;
 b=Rn1WDtq0qTwrozRlIUKzFiY9NVRqdFbuC6Xr6vx9qsnCrSfnAwRg1NqmzbI1OZ9XFx
 DtvaqohoLCLMp7EasW1Qn4s+3bWMkyfjgmGvQ7Qv4oCUaE2m4ZWoKwsLl6igmlg1Ey/8
 f+xA9e0J2g3g3Smw2S+fvXSEmQ5R1BYQsn4wN17eL79tNt3xwkQjwH64Zokei+6bUaPr
 nS8dCGPMMyvRpWGclPkwDNQTo8iMbDGPxSu+HY6zSwKZ5DspXGHfHctiLZFbSzI1QDXm
 TlTMRM4RltDv03o1Xw282WLjP6XfATFZeIbZ4xSMXhBad0v0MS930wC9fELME9ePQz7q
 hwng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWczaVT/3345WB0oG4MC2VzFuJZynZOA+CI9Znnkuhkh9pXHf7I5Vx3mSbQNQNKAcjrDjGqWlejH0ZYYA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzUHPpbM15TvZY/ur6nbNBhRN8MFI+masFZn2hp2Kvv3ucZ5IBI
 uAV3id5JgnUzNoe6qVkISIkgJNJYf3EP7Y6iBXrwyP3zZ1u2+jgkPvusB/cY5CePRuY=
X-Gm-Gg: ATEYQzz1Z4B0G5EBG0CkW8Elv9paZAeLH7Nmrm+R6YokboB0moly7XcaaWKZZikJ7bL
 x6cuEyr87BNaewksxHAVZPlF4D+a3FfjcYURWeaFZiYsfo3moJ5IEW28hQCBEi0I38yRGpmuSVc
 Fayu01MJnD+km2iWYpJFGwpXBTvQgrLrJR8vH/9pbpDD8InvYb/OneF/p8TPhsrFjsZ9/YO8dMi
 l7wkSysZogMKLm8BxtkTbcwwOqXqdnVFLfJqYxouKQEF1G+6U1xXRX+9eAnzHt1IXj5e4oqKLKi
 c2nC97UFjZS7zoaJKhlg4djg4ukBH5yA8Q1oXlYXTN4vy9vgx/r7UiPf/1115QP9TbiFIiBobxu
 /9rNpLIaNsx8QFk6Dfe8P1DvYbASGUCtKkiM+hTeOVOXUFkv5Xp71zQV+4jVhWX0Zj+r4vJkCh0
 tHifIBtqTUJQ014h8iqWZ5iTaEMCL7TEsJs5quvidcNzVrjaxgVM2JY9ODSb2dKMwe
X-Received: by 2002:a05:6122:8c17:b0:567:5ccc:1367 with SMTP id
 71dfb90a1353d-56b4752d741mr867076e0c.11.1773235448093; 
 Wed, 11 Mar 2026 06:24:08 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com.
 [209.85.221.173]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-56b46310835sm945170e0c.2.2026.03.11.06.24.07
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2026 06:24:07 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id
 71dfb90a1353d-56739adfa1aso10531050e0c.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Mar 2026 06:24:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUe/Vw8/pX5nJTAYFQ44Wy/U9ThZAa6zwmi7byiExEldjPeJh8BTll834MZAzunGaUUoE0bC+pYOfjq/g==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:6122:1d05:b0:55b:7494:177b with SMTP id
 71dfb90a1353d-56b4752d806mr922396e0c.10.1773234967338; Wed, 11 Mar 2026
 06:16:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-36-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-36-bd63b656022d@avm.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Mar 2026 14:15:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQ8Q4jvkgFRJYhghz2BZRDC-9Mk6DbXxuaOc6C9DFHZQ@mail.gmail.com>
X-Gm-Features: AaiRm52J84H77ROK64ZWWtJfaiCpnFeKyoSRmPbi-NC8CN6Ju1TJEFxJU9gZQQ8
Message-ID: <CAMuHMdXQ8Q4jvkgFRJYhghz2BZRDC-9Mk6DbXxuaOc6C9DFHZQ@mail.gmail.com>
To: Philipp Hahn <phahn-oss@avm.de>
Cc: linux-hyperv@vger.kernel.org, Rich Felker <dalias@libc.org>,
 kvm@vger.kernel.org, linux-sh@vger.kernel.org, samba-technical@lists.samba.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 gfs2@lists.linux.dev, linux-mm@kvack.org, linux-sctp@vger.kernel.org,
 target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-cifs@vger.kernel.org,
 linux-scsi@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 iommu@lists.linux.dev, intel-wired-lan@lists.osuosl.org,
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-media@vger.kernel.org,
 dm-devel@lists.linux.dev, linux-pm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com,
 linux-sound@vger.kernel.org, linux-block@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 ceph-devel@vger.kernel.org, linux-omap@vger.kernel.org,
 sched-ext@lists.linux.dev, cocci@inria.fr, linux-nfs@vger.kernel.org,
 ntfs3@lists.linux.dev, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-s390@vger.kernel.org, v9fs@lists.linux.dev, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-security-module@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-modules@vger.kernel.org,
 netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 36/61] arch/sh: Prefer IS_ERR_OR_NULL over
	manual NULL check
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
X-Rspamd-Queue-Id: C2D192646EA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:phahn-oss@avm.de,m:linux-hyperv@vger.kernel.org,m:dalias@libc.org,m:kvm@vger.kernel.org,m:linux-sh@vger.kernel.org,m:samba-technical@lists.samba.org,m:dri-devel@lists.freedesktop.org,m:linux-mips@vger.kernel.org,m:gfs2@lists.linux.dev,m:linux-mm@kvack.org,m:linux-sctp@vger.kernel.org,m:target-devel@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:linux-phy@lists.infradead.org,m:linux-clk@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-cifs@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-rockchip@lists.infradead.org,m:iommu@lists.linux.dev,m:intel-wired-lan@lists.osuosl.org,m:linux-arm-kernel@lists.infradead.org,m:linux-input@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-media@vger.kernel.org,m:dm-devel@lists.linux.dev,m:linux-pm@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:apparmor@lists.ubuntu.com,m:linux-sound@vger.kernel.org,m:linux-block@vger.kernel.org,m
 :linux-gpio@vger.kernel.org,m:glaubitz@physik.fu-berlin.de,m:ceph-devel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:sched-ext@lists.linux.dev,m:cocci@inria.fr,m:linux-nfs@vger.kernel.org,m:ntfs3@lists.linux.dev,m:ysato@users.sourceforge.jp,m:linux-s390@vger.kernel.org,m:v9fs@lists.linux.dev,m:linux-usb@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:tipc-discussion@lists.sourceforge.net,m:linux-modules@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:bpf@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-erofs@lists.ozlabs.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[57];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

On Tue, 10 Mar 2026 at 12:56, Philipp Hahn <phahn-oss@avm.de> wrote:
> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
>
> Change generated with coccinelle.
>
> To: Yoshinori Sato <ysato@users.sourceforge.jp>
> To: Rich Felker <dalias@libc.org>
> To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: linux-sh@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

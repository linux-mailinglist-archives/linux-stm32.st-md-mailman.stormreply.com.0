Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EpALLD4AWrOmwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 11 May 2026 17:41:36 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D00D511642
	for <lists+linux-stm32@lfdr.de>; Mon, 11 May 2026 17:41:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7651CC8F287;
	Mon, 11 May 2026 15:41:35 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7317DC8F274
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2026 15:41:33 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-48896199cbaso41064695e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2026 08:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778514093; x=1779118893;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QYUz8b5kzsmvQFipBJ/YClQFCzx8AI1CLI1nrVUTxv0=;
 b=WLqbIM5pw1dC8R9bQLgCHXNCT+dTvkFO+frWT154ye4n20PV3dFYNjYMd9U6+DLGgd
 k39o9XfdspKA6JMZNwyCS2SH6yYkUrlA1RXrpHd86JAINrQQH1ZFgpJMms7yFuukX3Hi
 nX+l8j4geFIcydp5S2Tf0tu9LQwB7YLs43hLqOTuGu8jKsQn/NcZC5ZHbXA7+EXg2qLn
 /igxVwW2jFfvb0FZAl45+VT4F0/NCaXxjHYQnA6oHIDSZDW6FAlaDX7gCWccZHa2DVWS
 uw//axYy3b4fwrcyb11ZJfNpE653cFtQGevbL3yN+s/VdxHFMzccQ2XAE1CUOZirjh1Z
 Ts2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778514093; x=1779118893;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QYUz8b5kzsmvQFipBJ/YClQFCzx8AI1CLI1nrVUTxv0=;
 b=FAANm3blfeIJu39soRBAbTMXqbq9HxKWddnFgZYlnIfcMKWj9+R1CY16J+asWBpLrw
 ek/IS/9fBsrA7+82ZN6/GCmxFhI69tO9XK1vb8Q2vZcRc5yyTKQuPC6aeoZoaZ05VnSh
 NKQyoF99vn5VUu0oEVdlKfpip+fA7KFrdcyKibwg9JwqB9Ggbua8u2xtGP7nOloTdqdL
 Q94Vhx4+u3EcX9r00i9LSQokU1Lw/sqKQWlNpq+w4fQqyzxgCDWXxJpjG4ODQvYw+BdX
 0TblJuHUm/0y6KNYdmDBFLPIw76Zh1cNX5zXpHi3FogP5nVCuYVoWfV2pC7vDtV3nYhh
 rLag==
X-Forwarded-Encrypted: i=1;
 AFNElJ/C8TavfMlwP+Wk+jE94x2GF/QqBrd0UYGXCoNwI6XXAbjAQHzLnoBHAyS0FXKVTjZaKne6GrjWgU+qig==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzlu0nZX4NYQ9WtTYPWZFgTymsQJsOz2gO2PIm/UnKvClEQ8+hg
 yGR6c4JPnFDx8AOONcQzOtPNd7vDR/c2O/3j2a2bmmOmxsOqR8ltPIU5jd1UNXsPV+g=
X-Gm-Gg: Acq92OH9NFKLM57T2fNeuW43hspnDtVoxhzZR8NeZevVjJnWt09wJotzgm1QsZTWvDf
 pAsg5/uAu+KgH77bBq6jwBlzyz+2hCENbaVQxMdyxZfU2HOLqWzxKebMFV6SMpWkX/ObvmB+ppW
 uaxnhXNqNNZuKAPkX2wecAJl1bMhKqdBj5pZYsQCR77m1Y2ltteM9BdFDXqW3wvCNYZSlRZ70pn
 PJ+dwBaaN1mCO2tMWsz3f5UrgrwBkYKkTUCFsnsdqLz5nQRlzGnd5D9agJjUCRwvn7EtbYh34Yj
 TgC/aYhpOWsqZqLy+TJdKvhVuJQ/U6/yYmb7P/rpWLGN8otkhp+j3cv4GfYQ7TMlNeQ0vWYdtEC
 UFf85v9iAP/a7vnyB+9nwumtWKZIv8L/6E88lD6iSLdUN94sYkWKmgw1wZPaEwO7theSVuIahrT
 r2SIWia36/S5y9M6jb2IDK3FvU40burwF4Bg5A5sfKj1Uv6mtaUwD+luWpwqi8hSuC9DqNUcM16
 E5AvuQ5DsmUNTGczaaQ+E70clDi48a15udPNhAhd9UTf50XryrBfWnmuyNBD92Z1HakaRp3oGkq
 o8leSayu
X-Received: by 2002:a05:600c:1f89:b0:48e:8741:fd42 with SMTP id
 5b1f17b1804b1-48e8741ff8cmr37216095e9.12.1778514092586; 
 Mon, 11 May 2026 08:41:32 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e6d8e3247sm64622295e9.8.2026.05.11.08.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2026 08:41:31 -0700 (PDT)
Date: Mon, 11 May 2026 16:41:28 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Xilin Wu <sophon@radxa.com>
Message-ID: <agH4qC74A540koDl@aspen.lan>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-11-elder@riscstar.com>
 <DD71CDEABC7C16D5+02d052ff-13bb-4712-a847-91416f76c578@radxa.com>
 <7f3a0f16-5159-4bbc-8b15-9b5841603bf6@riscstar.com>
 <3A5C0389E7C0D241+21a4f16b-1af8-46ac-8831-0c1b49694df0@radxa.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3A5C0389E7C0D241+21a4f16b-1af8-46ac-8831-0c1b49694df0@radxa.com>
Cc: me@ziyao.cc, ast@kernel.org, linux-kernel@vger.kernel.org,
 chenchuangyu@xiaomi.com, edumazet@google.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 mohd.anwar@oss.qualcomm.com, weishangjuan@eswincomputing.com,
 Alex Elder <elder@riscstar.com>, daniel@iogearbox.net, chenhuacai@kernel.org,
 john.fastabend@gmail.com, maxime.chevallier@bootlin.com,
 siyanteng@cqsoftware.com.cn, sdf@fomichev.me, kuba@kernel.org,
 pabeni@redhat.com, konradybcio@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, hawk@kernel.org, arnd@arndb.de, brgl@kernel.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 livelycarpet87@gmail.com, linux-gpio@vger.kernel.org,
 rmk+kernel@armlinux.org.uk, wens@kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org,
 linusw@kernel.org, a0987203069@gmail.com, davem@davemloft.net,
 andrew+netdev@lunn.ch, boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com,
 inochiama@gmail.com, krzk+dt@kernel.org, julianbraha@gmail.com,
 matthew.gerlach@altera.com, andersson@kernel.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 10/12] net: stmmac: tc956x: add
 TC956x/QPS615 support
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
X-Rspamd-Queue-Id: 4D00D511642
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sophon@radxa.com,m:me@ziyao.cc,m:ast@kernel.org,m:linux-kernel@vger.kernel.org,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:elder@riscstar.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:maxime.chevallier@bootlin.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:hawk@kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:linux-gpio@vger.kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:bpf@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:gregkh@linuxfoundation.org,m:linusw@kernel.org,m:a09872030
 69@gmail.com,m:davem@davemloft.net,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:inochiama@gmail.com,m:krzk+dt@kernel.org,m:julianbraha@gmail.com,m:matthew.gerlach@altera.com,m:andersson@kernel.org,m:hkallweit1@gmail.com,m:johnfastabend@gmail.com,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[daniel@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[49];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[ziyao.cc,kernel.org,vger.kernel.org,xiaomi.com,google.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,riscstar.com,iogearbox.net,gmail.com,bootlin.com,cqsoftware.com.cn,fomichev.me,redhat.com,arndb.de,altera.com,bp.renesas.com,armlinux.org.uk,lists.infradead.org,linuxfoundation.org,davemloft.net,lunn.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[daniel@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:-];
	NEURAL_HAM(-0.00)[-0.473];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url]
X-Rspamd-Action: no action

Hi Xilin

On Thu, May 07, 2026 at 09:57:26PM +0800, Xilin Wu wrote:
> Do you think if a shutdown callback like this is required? It looks like the
> driver sometimes does a MDIO MMIO read when the PCIe link is down, causing
> the board to reset due to SoC side PCIe NoC timeout.
>
> After this change, the board can always shutdown gracefully.

I've preferred controlled reboots to power cycles throughout development
and I hadn't spotted any major problems with graceful shutdown (which
isn't to say there have never crashes but generally I expect `reboot`
to provoke a reboot successfully).

Just to be sure configured my board with irq=POLL (to match your setup)
and still can't reproduce.

We mostly run Debian/systemd so there might be something happening in
userspace to sequence things nicely. However I have ruled out
NetworkManager.service and networking.service (stopped this services
does *not* tear down the network link).

Can you share a bit more about how to reproduce the problem (including
reliability of reproduction)?


Daniel.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

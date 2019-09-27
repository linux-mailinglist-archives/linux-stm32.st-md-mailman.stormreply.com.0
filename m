Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D15C0D0E
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Sep 2019 23:12:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60ECAC36B0B;
	Fri, 27 Sep 2019 21:12:39 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0B14C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Sep 2019 21:12:36 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id o10so4107200pgs.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Sep 2019 14:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MT3rEIfaJgpzvHmFM2pWeqN2XOEfjsN3Ht7YF+hthq8=;
 b=HWrjXwmyGQrWIktNn2lCfS/WWNp3jM0GJkqLaICHIq/FPWxfdSodtSpyQmZZZSqYKl
 gLWJ5uiWHrbfp7XRrlbm5tcLBi0mF8wxUQGVBvHdC+YrHRlTUWjnN/4obhqljgrPTG3A
 RZtBAyLun1kMIfwj+XzanCaE7pfz5X+1U1DEEWl4a0HFqU4UC+8fia7u1zVDsy87zqmM
 aCnZO4WYMlXyBvwTDY5YzycIIMk8vbQav6mKwEUaLZN6qC6Wase6y5kT8waFE/KYHjR2
 sI+xNuy9ZVIQOG/d3gqTWFx/1AYoGsrnH4KQyKPBRTWgKQPqX7caUSWi/ZiuXFXkwHDR
 u2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MT3rEIfaJgpzvHmFM2pWeqN2XOEfjsN3Ht7YF+hthq8=;
 b=aogB76ddaKf0Rr9T0tvjN3EiBu7h6iBTIHD6xeIGicRvqGL4iH650q/1KUGL089fDM
 b0qREpmQ/LF0VZbGiuYCwtImon0n37k23SyeOh9QWJqRHBvyOpCcyFtmDDpo0v4x71SW
 Y8F4RMRSv4JCJ7lHCcTI3k4ti5ZguW5BEWmxN+ZZH+v/ZeENE7440onSJOtGqP7Oc187
 AylmstOFlQ2FN98d+6+6ROEpmYd45un6s+Wd2YXqb9ty3wAe9dX2M0VPRe9cBtzVaCT3
 kcfVLyesqkZRyVNAGEV6mZkg8ME90X+EwI5lk6JEVzdSwYBdzgXzqj0WGbKI3bPoNbFW
 MOhQ==
X-Gm-Message-State: APjAAAX3f/Dbx0A4RbhSvCq3/tt1r8CJeZiRNFonDIFKj5p9gUMYJ4Ih
 r3hbR814MwTYGig4O/REBwoxBa+3SOrIuFre0Sn6tg==
X-Google-Smtp-Source: APXvYqy8O3KoXcSTxHqiytQM1iXWb+WWT9oKskcwqzyLQpgWA96K2vO/7MEIdTwZ75zGDyeYqjyajaWRaH5XxPonWcc=
X-Received: by 2002:a62:798e:: with SMTP id u136mr6912504pfc.3.1569618754157; 
 Fri, 27 Sep 2019 14:12:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1569569778.git.Jose.Abreu@synopsys.com>
 <80dd26ecf7fc82c88dc378d78210df5dd4138812.1569569778.git.Jose.Abreu@synopsys.com>
In-Reply-To: <80dd26ecf7fc82c88dc378d78210df5dd4138812.1569569778.git.Jose.Abreu@synopsys.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 27 Sep 2019 14:12:23 -0700
Message-ID: <CAKwvOdntD5HNb4Gg04YN7iZwvK3CB4enq4ZPhUM-Bd3huvR2pw@mail.gmail.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Cc: Joao Pinto <Joao.Pinto@synopsys.com>,
 Network Development <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net 8/8] net: stmmac: xgmac: Fix RSS not
 writing all Keys to HW
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

On Fri, Sep 27, 2019 at 12:49 AM Jose Abreu <Jose.Abreu@synopsys.com> wrote:
>
> The sizeof(cfg->key) is != ARRAY_SIZE(cfg->key). Fix it.

I think the warning was from -Wsizeof-array-div.

>
> Reported-by: kbuild test robot <lkp@intel.com>
> Reported-by: Nick Desaulniers <ndesaulniers@google.com>

I may have reported the kbuild link, but scanning my email, there's
also a report from
Reported-by: Nathan Chancellor <natechancellor@gmail.com>

> Fixes: 76067459c686 ("net: stmmac: Implement RSS and enable it in XGMAC core")
> Signed-off-by: Jose Abreu <Jose.Abreu@synopsys.com>
>
> ---
> Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Jose Abreu <joabreu@synopsys.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: netdev@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> index 6d8ac2ef4fc2..4a1f52474dbc 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> @@ -533,7 +533,7 @@ static int dwxgmac2_rss_configure(struct mac_device_info *hw,
>                 return 0;
>         }
>
> -       for (i = 0; i < (sizeof(cfg->key) / sizeof(u32)); i++) {
> +       for (i = 0; i < (ARRAY_SIZE(cfg->key) / sizeof(u32)); i++) {

cfg is an instance of struct stmmac_rss, which looks like:
125 struct stmmac_rss {
126   int enable;
127   u8 key[STMMAC_RSS_HASH_KEY_SIZE];
128   u32 table[STMMAC_RSS_MAX_TABLE_SIZE];
129 };

yep, LGTM. Thanks for the patch.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>


>                 ret = dwxgmac2_rss_write_reg(ioaddr, true, i, cfg->key[i]);
>                 if (ret)
>                         return ret;
> --
> 2.7.4
>


--
Thanks,
~Nick Desaulniers
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

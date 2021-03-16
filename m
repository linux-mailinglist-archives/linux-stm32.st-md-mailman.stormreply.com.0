Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3D733DA07
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Mar 2021 18:01:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86E63C57B78;
	Tue, 16 Mar 2021 17:01:59 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99266C56632
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Mar 2021 13:51:04 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id v14so12684347ilj.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Mar 2021 06:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iUQn9vAiShCIKJ+8B/1Ypkb0F0c7ZlB9Q62OdvxGxHQ=;
 b=hrCS8Dlm1Y+8XvZlJ7knYuJ0NXSjcxwKLgXhXMzkVPIZkV6UZul4d9sLUB3+BzJaoC
 D/5xzt9GwzbKz8O+VZmxTvJa3uRBhTt7YgRAqC52W8rjAMGr6nSRd2gI/GCXrDZ9ZxkW
 pmtnaTjEYrXMK2JW+AGmFckIqqrcNqMnAdc6kSSY3bGX5wY57O9GQVUafahzFP3EBaOd
 m7L1E4Tmh+cRNTjGizF8zcCrb5MovAcX0HLY2I8xQgwMdtdR5X6ShfS8mEA3O8rrIs/5
 xaQ85JC3ZXgp1QsvhHDE0n8YKTwDNv9suKVKjiBaDw0Il9+1/vEXpDmbKyP5DZ1oHk33
 alBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iUQn9vAiShCIKJ+8B/1Ypkb0F0c7ZlB9Q62OdvxGxHQ=;
 b=dwzl6Qd2yvlAyStS5sKUzJeKjeMyUiZhgM1Td1sInhP86SXjm09u0SKJoUpqOO0frv
 pWrkL4Zh/+8SUUPlEI1OEdAxeEHvd0pr4LXjTLIxwQsqPjTMtKtg8msU1wFC3oXcBIVM
 R1bW9eQJAVF4p3unp7RS1Qic0GZ24i8nBuTgSRkA8gpnsO2xgTqq7mNSTcA54082/THh
 HYhQ4B9ECI7BeP73OyUVWQzVCuXEiJggy9rDhUMRSDHvzb9h9X9cpsTdeCqZGfeH9DVc
 Zp90fmnA0fmSwcbAoaUdg6TLmT9zLplrsiCyWbnj3pBHOGPTlUUbW6nkwGRW/IxVey3T
 xscA==
X-Gm-Message-State: AOAM530GbGjnTzaNaZ7MBlmUqRnUuGtVESMJ60Lb102kn3lUd3skCLKT
 P5Vdc4XUfIQKjDScaP1epx/SCX5PcLKVGOn7d5w=
X-Google-Smtp-Source: ABdhPJxNMUNrqBRZgveqBJB96fQitRk2jusPNg+tRrL2Qkny1h/pplAw+qT71eYmiGbdneU2eArkywgVJOaWwHR0NSc=
X-Received: by 2002:a05:6e02:156e:: with SMTP id
 k14mr3801626ilu.200.1615902663376; 
 Tue, 16 Mar 2021 06:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210316074239.2010897-1-weiyongjun1@huawei.com>
In-Reply-To: <20210316074239.2010897-1-weiyongjun1@huawei.com>
From: Edmundo Carmona Antoranz <eantoranz@gmail.com>
Date: Tue, 16 Mar 2021 07:50:51 -0600
Message-ID: <CAOc6etYcE-0wbcWxgTH49h1Odepg=Esc_gmfDoUioHOsnNj33Q@mail.gmail.com>
To: "'w00385741" <weiyongjun1@huawei.com>
X-Mailman-Approved-At: Tue, 16 Mar 2021 17:01:58 +0000
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, Hulk Robot <hulkci@huawei.com>,
 Jose Abreu <joabreu@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: fix missing unlock
	on error in stmmac_suspend()
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
Content-Type: multipart/mixed; boundary="===============7258676935896357644=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============7258676935896357644==
Content-Type: multipart/alternative; boundary="0000000000003e043905bda7a872"

--0000000000003e043905bda7a872
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 16, 2021 at 3:21 AM 'w00385741 <weiyongjun1@huawei.com> wrote:
>
> -               if (ret)
> +               if (ret) {
> +                       mutex_unlock(&priv->lock);
>                         return ret;
> +               }
>         }
>         mutex_unlock(&priv->lock);
>

I think you can let it go and check ret after unlocking:

                /* Disable clock in case of PWM is off */
               clk_disable_unprepare(priv->plat->clk_ptp_ref);
               ret = pm_runtime_force_suspend(dev);
       }
       mutex_unlock(&priv->lock);
       if (ret)
               return ret;

       priv->speed = SPEED_UNKNOWN;
       return 0;

--0000000000003e043905bda7a872
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGJyPjxicj5PbiBUdWUsIE1hciAxNiwgMjAyMSBhdCAzOjIxIEFNICYj
Mzk7dzAwMzg1NzQxICZsdDs8YSBocmVmPSJtYWlsdG86d2VpeW9uZ2p1bjFAaHVhd2VpLmNvbSI+
d2VpeW9uZ2p1bjFAaHVhd2VpLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj4mZ3Q7PGJyPiZndDsgLSDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBpZiAocmV0KTxicj4mZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgaWYgKHJldCkgezxicj4mZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
bXV0ZXhfdW5sb2NrKCZhbXA7cHJpdi0mZ3Q7bG9jayk7PGJyPiZndDsgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgcmV0dXJuIHJldDs8YnI+Jmd0OyArIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIH08YnI+Jmd0OyDCoCDCoCDCoCDCoCB9PGJyPiZndDsgwqAgwqAgwqAgwqAgbXV0ZXhf
dW5sb2NrKCZhbXA7cHJpdi0mZ3Q7bG9jayk7PGJyPiZndDs8YnI+PGJyPkkgdGhpbmsgeW91IGNh
biBsZXQgaXQgZ28gYW5kIGNoZWNrIHJldCBhZnRlciB1bmxvY2tpbmc6PGRpdj48YnI+PHNwYW4g
c3R5bGU9ImZvbnQtZmFtaWx5Om1vbm9zcGFjZSI+PHNwYW4gc3R5bGU9ImNvbG9yOnJnYigwLDAs
MCkiPsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qIERpc2FibGUgY2xvY2sgaW4gY2FzZSBvZiBQ
V00gaXMgb2ZmICovDQo8L3NwYW4+PGJyPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBj
bGtfZGlzYWJsZV91bnByZXBhcmUocHJpdi0mZ3Q7cGxhdC0mZ3Q7Y2xrX3B0cF9yZWYpOw0KPGJy
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSBwbV9ydW50aW1lX2ZvcmNlX3N1
c3BlbmQoZGV2KTsNCjxicj4gwqDCoMKgwqDCoMKgwqB9DQo8YnI+IMKgwqDCoMKgwqDCoMKgbXV0
ZXhfdW5sb2NrKCZhbXA7cHJpdi0mZ3Q7bG9jayk7DQo8YnI+IMKgwqDCoMKgwqDCoMKgaWYgKHJl
dCkNCjxicj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsNCjxicj4N
Cjxicj4gwqDCoMKgwqDCoMKgwqBwcml2LSZndDtzcGVlZCA9IFNQRUVEX1VOS05PV047DQo8YnI+
IMKgwqDCoMKgwqDCoMKgcmV0dXJuIDA7PGJyPg0KPGJyPjwvc3Bhbj48L2Rpdj48L2Rpdj4NCg==
--0000000000003e043905bda7a872--

--===============7258676935896357644==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7258676935896357644==--

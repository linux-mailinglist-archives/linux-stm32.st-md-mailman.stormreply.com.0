Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 234A512D7CC
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Dec 2019 11:12:34 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCE1DC36B0B;
	Tue, 31 Dec 2019 10:12:33 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C11CC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Dec 2019 10:12:32 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id o13so24493459ljg.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Dec 2019 02:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sYidT8cA6/M5ZOcRmE0d5onegqqpe9/lv8i6pNEaUps=;
 b=X2ayaav5pA7MM+KDIIY6EVL62/ilIJWRbII6hQrPv8J6spDZIOjE4LnOX7dGL/7wwl
 dle64UH91jWQiLP9rol7pBRG4MYWWZJY3SlOw/K1Cw7VxlFi5Z3haVOyOHLT1Q2KIQCw
 xwWS/iiiTl4dbgjuyRkXiEJI4uE5H4+faG+qAXS0Rc2ZYlNZP2owOnFsG1+tog7CLDVl
 kPw27rrAQNE5NSzM1zTx/DtbqUhh2kN5Sy8oW01lIAI0XzfnoshuuKZB/WJgxBZCPgOn
 QjdfN0IrLOHhAfNW5M38q2vnbPu0Cu6hn0CK5yHL/y4wDbZKE2ZpoMp6oKJbVkFXAK++
 A8uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sYidT8cA6/M5ZOcRmE0d5onegqqpe9/lv8i6pNEaUps=;
 b=Jqets4eUUjF2PeRSt5LjUlabIBNlimCBPjpTvOWpDMjs2ZPuEixu3W1f7KXZx8zOeg
 qYefL7XsnMq6PgmsLiy2QeoD3JXMtp1fO359X9Qao0TGu0fEzVUJ64o1cTzrwiuY4HvZ
 bngK2uSSU0BcY55zldsopfJGvFvUfcFdMjVO9EuBLEXbTA2IBFExC8CN3oCljK+tHnnc
 L933LrCjVHa69gm2BP3Exj0vyvms4Z3YY47SOCB2ZbUR1VgoWF6cVNZGaOBh41Vo+5/j
 2E5qNaa8LF3HR8qTrVdhBFpdSlzQ+3Hak0M3tTYCKDNrf2nAHZQPvQYift/yd3KGBZrx
 u/mw==
X-Gm-Message-State: APjAAAXaTxhcfEzQ7mvrwbbjl/tvatRGvpK6ndlxkfJImekj7Ny+24Mr
 88QkTbd2ZtC+bwWbMCOcY+nGjg==
X-Google-Smtp-Source: APXvYqz3o9BNQOLYRcJKaBB89OeIbOZreMSdC+Y1SprnU0gutIUg4V9KRPDOu+KX+7jC75FdTe8Kfg==
X-Received: by 2002:a2e:8797:: with SMTP id n23mr40379304lji.176.1577787151735; 
 Tue, 31 Dec 2019 02:12:31 -0800 (PST)
Received: from ?IPv6:2a00:1fa0:646:8dc9:cad:7023:48c4:5145?
 ([2a00:1fa0:646:8dc9:cad:7023:48c4:5145])
 by smtp.gmail.com with ESMTPSA id z7sm23586452lfa.81.2019.12.31.02.12.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Dec 2019 02:12:31 -0800 (PST)
To: Jiping Ma <jiping.ma2@windriver.com>, peppe.cavallaro@st.com,
 alexandre.torgue@st.com
References: <20191231020302.71792-1-jiping.ma2@windriver.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <57dcdaa1-feff-1134-919e-57b37e306431@cogentembedded.com>
Date: Tue, 31 Dec 2019 13:12:29 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191231020302.71792-1-jiping.ma2@windriver.com>
Content-Language: en-US
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] stmmac: debugfs entry name is not be
 changed when udev rename device name.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hello!

On 31.12.2019 5:03, Jiping Ma wrote:

> Add one notifier for udev changes net device name.
> 
> Signed-off-by: Jiping Ma <jiping.ma2@windriver.com>
> ---
>   .../net/ethernet/stmicro/stmmac/stmmac_main.c | 38 ++++++++++++++++++-
>   1 file changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index b14f46a57154..c1c877bb4421 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4038,6 +4038,40 @@ static int stmmac_dma_cap_show(struct seq_file *seq, void *v)
>   }
>   DEFINE_SHOW_ATTRIBUTE(stmmac_dma_cap);
>   
> +/**
> + * Use network device events to create/remove/rename
> + * debugfs file entries
> + */
> +static int stmmac_device_event(struct notifier_block *unused,
> +			       unsigned long event, void *ptr)
> +{
> +	struct net_device *dev = netdev_notifier_info_to_dev(ptr);
> +	struct stmmac_priv *priv = netdev_priv(dev);
> +
> +	switch (event) {
> +	case NETDEV_CHANGENAME:
> +		if (priv->dbgfs_dir)
> +			priv->dbgfs_dir = debugfs_rename(stmmac_fs_dir,
> +							 priv->dbgfs_dir,
> +							 stmmac_fs_dir,
> +							 dev->name);
> +		break;
> +
> +	case NETDEV_GOING_DOWN:
> +		break;
> +
> +	case NETDEV_UP:
> +		break;

    Why not merge the above 2 cases? Or just remove them('event' is not *enum*)?

> +	}
> +
> +done:
> +	return NOTIFY_DONE;
> +}
[...]

MBR, Sergei
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

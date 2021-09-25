Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A82044184F4
	for <lists+linux-stm32@lfdr.de>; Sun, 26 Sep 2021 00:26:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 603E7C5A4F7;
	Sat, 25 Sep 2021 22:26:23 +0000 (UTC)
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31AB1C0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Sep 2021 22:26:22 +0000 (UTC)
Received: from [10.172.193.212] (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id A524D40CE5; 
 Sat, 25 Sep 2021 22:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632608781;
 bh=kghkwBWuSi2KeCYfmmsja7Y4UgI7JLFaNj84dsKEBzU=;
 h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=otU+XFmriqtjTLbCIIUykHXeBxBMA+b9iWperMJeM58rCVZBo7DVgKL/+BP6gVjcV
 rbhzBIV4SKCtNeXnzXmJjrf6NCRQv9UL+oDRj51LhT0ZBsc3FLMFALQ2d0psFLU3/o
 n+oSmGpI/QPTZUcTdLUUGwpDbKmWJYaaEbrBKBAULgzCBQoWq0nWqGmzIawMahRYsl
 zISa2tNkI3gaBLtpGpgF8/Sdox5BiPkNgeb4++V46kP15yDCd4I3DdmNJG/iLf0JcJ
 3U8E/jkDZGg4YOQLK03sJ4XltlxmzcD1gg7I09s/JJ8ka1DglV4ICr0KUvZNUo327d
 BZpnWUV0i1iDw==
From: Colin Ian King <colin.king@canonical.com>
To: Jiri Kosina <jikos@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20210925222216.182099-1-colin.king@canonical.com>
Message-ID: <f8e8c609-ac7f-2b6a-b8bf-57a53fadfa1d@canonical.com>
Date: Sat, 25 Sep 2021 23:26:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210925222216.182099-1-colin.king@canonical.com>
Content-Language: en-US
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] NAK: [PATCH] HID: thrustmaster: Initialized pointer
 twi with NULL rather than 0
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

On 25/09/2021 23:22, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointers should be initialized with NULL rather than 0. Fix this.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/hid/hid-thrustmaster.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-thrustmaster.c b/drivers/hid/hid-thrustmaster.c
> index d44550aa8805..aa874f075bf9 100644
> --- a/drivers/hid/hid-thrustmaster.c
> +++ b/drivers/hid/hid-thrustmaster.c
> @@ -205,7 +205,7 @@ static void thrustmaster_model_handler(struct urb *urb)
>  	struct tm_wheel *tm_wheel = hid_get_drvdata(hdev);
>  	uint16_t model = 0;
>  	int i, ret;
> -	const struct tm_wheel_info *twi = 0;
> +	const struct tm_wheel_info *twi = NULL;
>  
>  	if (urb->status) {
>  		hid_err(hdev, "URB to get model id failed with error %d\n", urb->status);
> 

NACK, I spotted another pointer than needs the same change, will send a V2.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

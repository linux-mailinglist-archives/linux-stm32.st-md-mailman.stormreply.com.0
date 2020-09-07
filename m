Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA1B25F47D
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Sep 2020 10:02:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0200DC36B37;
	Mon,  7 Sep 2020 08:02:48 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39D05C36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Sep 2020 08:02:46 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id z9so13255858wmk.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Sep 2020 01:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FOIGm+MeZY0iZ8ZG3rTpB5cPrFLcLRaJXQUNLhkaUH8=;
 b=1slvBdVF6gktdLRkcVj06lZvoe6Qrqs3W66mp8erMOhDkKIW2iON4VPXYv+vn+wTtW
 9iuhcOGBdhYIBG39D6C2bgsiUHkc7D11VWGYSzYdKWTrOI59kEDFKYrcIFU1GKJuYx4M
 7cyeguz8SkW0dUfj3KldhTyby5nuL5x0Pod27dUm2pQcTg25yLS9g/Z9AcNAKoLbfqML
 hk8bCjU/TMJUVhI9o9B0wqsxjqshbAZwWN/E/zvsy9PFURtbH9UU+kTi0a/6xjGYlO5w
 pUAGZSDkk0jq5AL56cd+WtiVrbnzMKcioH0vaaJLwaE2uvyCwaEjRUBePfV11J45MmjE
 VDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=FOIGm+MeZY0iZ8ZG3rTpB5cPrFLcLRaJXQUNLhkaUH8=;
 b=EWWUgeygu4rfqPPWrjL24HZhy08XZhXJkvl/12Yqz76FcsUIs8wGtMj3rqkwcFNF30
 8PgdahTBREsvwOaIYBf1vaDxKbvvLg6LykEi83LDWajyy8Symq4AzLbSyO4LRy3o86Qk
 ItktccvGmLQAnk+8oBPq2jm1zhtbXiml9WfYu/8Qp7qyxIID9Bn2tX4aakSJgLAfoB6I
 6RGCu14hby2wJp72Oy8x5lIuQqHO1xdIYKrj2I1TzPN7Uon4fpDH0RqQp/NeaeU9ihtB
 RdsSK0/UOAvSehLhfOaGS40FVTXVoJP0Pph0VUkJctDBH/vSlmQdanP45+KgupThXOj9
 evvQ==
X-Gm-Message-State: AOAM533etaAuh9zdtbsb7Ai7rMwayeOeqcQD+ZnJfYAlhgzcbxo5ftnZ
 YZkTVvCMl9Evt7v0Vr8gj7sOLQ==
X-Google-Smtp-Source: ABdhPJzA303LnVSpPs0rqqJVdZ6G5OpDglfAlF6qYYFUtQ+Oe38yabLNx+Gpkfq7wzvX9BSBqalEbA==
X-Received: by 2002:a1c:b703:: with SMTP id h3mr19171992wmf.131.1599465765687; 
 Mon, 07 Sep 2020 01:02:45 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac?
 ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id b1sm27730168wru.54.2020.09.07.01.02.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2020 01:02:45 -0700 (PDT)
To: Yannick Fertre <yannick.fertre@st.com>,
 Philippe Cornu <philippe.cornu@st.com>,
 Benjamin Gaignard <benjamin.gaignard@st.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20200701143131.841-1-yannick.fertre@st.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT7CwHsEEwEKACUC
 GyMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJXDO2CAhkBAAoJEBaat7Gkz/iubGIH/iyk
 RqvgB62oKOFlgOTYCMkYpm2aAOZZLf6VKHKc7DoVwuUkjHfIRXdslbrxi4pk5VKU6ZP9AKsN
 NtMZntB8WrBTtkAZfZbTF7850uwd3eU5cN/7N1Q6g0JQihE7w4GlIkEpQ8vwSg5W7hkx3yQ6
 2YzrUZh/b7QThXbNZ7xOeSEms014QXazx8+txR7jrGF3dYxBsCkotO/8DNtZ1R+aUvRfpKg5
 ZgABTC0LmAQnuUUf2PHcKFAHZo5KrdO+tyfL+LgTUXIXkK+tenkLsAJ0cagz1EZ5gntuheLD
 YJuzS4zN+1Asmb9kVKxhjSQOcIh6g2tw7vaYJgL/OzJtZi6JlIXOwU0EVid/pAEQAND7AFhr
 5faf/EhDP9FSgYd/zgmb7JOpFPje3uw7jz9wFb28Cf0Y3CcncdElYoBNbRlesKvjQRL8mozV
 9RN+IUMHdUx1akR/A4BPXNdL7StfzKWOCxZHVS+rIQ/fE3Qz/jRmT6t2ZkpplLxVBpdu95qJ
 YwSZjuwFXdC+A7MHtQXYi3UfCgKiflj4+/ITcKC6EF32KrmIRqamQwiRsDcUUKlAUjkCLcHL
 CQvNsDdm2cxdHxC32AVm3Je8VCsH7/qEPMQ+cEZk47HOR3+Ihfn1LEG5LfwsyWE8/JxsU2a1
 q44LQM2lcK/0AKAL20XDd7ERH/FCBKkNVzi+svYJpyvCZCnWT0TRb72mT+XxLWNwfHTeGALE
 +1As4jIS72IglvbtONxc2OIid3tR5rX3k2V0iud0P7Hnz/JTdfvSpVj55ZurOl2XAXUpGbq5
 XRk5CESFuLQV8oqCxgWAEgFyEapI4GwJsvfl/2Er8kLoucYO1Id4mz6N33+omPhaoXfHyLSy
 dxD+CzNJqN2GdavGtobdvv/2V0wukqj86iKF8toLG2/Fia3DxMaGUxqI7GMOuiGZjXPt/et/
 qeOySghdQ7Sdpu6fWc8CJXV2mOV6DrSzc6ZVB4SmvdoruBHWWOR6YnMz01ShFE49pPucyU1h
 Av4jC62El3pdCrDOnWNFMYbbon3vABEBAAHCwn4EGAECAAkFAlYnf6QCGwICKQkQFpq3saTP
 +K7BXSAEGQECAAYFAlYnf6QACgkQd9zb2sjISdGToxAAkOjSfGxp0ulgHboUAtmxaU3viucV
 e2Hl1BVDtKSKmbIVZmEUvx9D06IijFaEzqtKD34LXD6fjl4HIyDZvwfeaZCbJbO10j3k7FJE
 QrBtpdVqkJxme/nYlGOVzcOiKIepNkwvnHVnuVDVPcXyj2wqtsU7VZDDX41z3X4xTQwY3SO1
 9nRO+f+i4RmtJcITgregMa2PcB0LvrjJlWroI+KAKCzoTHzSTpCXMJ1U/dEqyc87bFBdc+DI
 k8mWkPxsccdbs4t+hH0NoE3Kal9xtAl56RCtO/KgBLAQ5M8oToJVatxAjO1SnRYVN1EaAwrR
 xkHdd97qw6nbg9BMcAoa2NMc0/9MeiaQfbgW6b0reIz/haHhXZ6oYSCl15Knkr4t1o3I2Bqr
 Mw623gdiTzotgtId8VfLB2Vsatj35OqIn5lVbi2ua6I0gkI6S7xJhqeyrfhDNgzTHdQVHB9/
 7jnM0ERXNy1Ket6aDWZWCvM59dTyu37g3VvYzGis8XzrX1oLBU/tTXqo1IFqqIAmvh7lI0Se
 gCrXz7UanxCwUbQBFjzGn6pooEHJYRLuVGLdBuoApl/I4dLqCZij2AGa4CFzrn9W0cwm3HCO
 lR43gFyz0dSkMwNUd195FrvfAz7Bjmmi19DnORKnQmlvGe/9xEEfr5zjey1N9+mt3//geDP6
 clwKBkq0JggA+RTEAELzkgPYKJ3NutoStUAKZGiLOFMpHY6KpItbbHjF2ZKIU1whaRYkHpB2
 uLQXOzZ0d7x60PUdhqG3VmFnzXSztA4vsnDKk7x2xw0pMSTKhMafpxaPQJf494/jGnwBHyi3
 h3QGG1RjfhQ/OMTX/HKtAUB2ct3Q8/jBfF0hS5GzT6dYtj0Ci7+8LUsB2VoayhNXMnaBfh+Q
 pAhaFfRZWTjUFIV4MpDdFDame7PB50s73gF/pfQbjw5Wxtes/0FnqydfId95s+eej+17ldGp
 lMv1ok7K0H/WJSdr7UwDAHEYU++p4RRTJP6DHWXcByVlpNQ4SSAiivmWiwOt490+Ac7ATQRN
 WQbPAQgAvIoM384ZRFocFXPCOBir5m2J+96R2tI2XxMgMfyDXGJwFilBNs+fpttJlt2995A8
 0JwPj8SFdm6FBcxygmxBBCc7i/BVQuY8aC0Z/w9Vzt3Eo561r6pSHr5JGHe8hwBQUcNPd/9l
 2ynP57YTSE9XaGJK8gIuTXWo7pzIkTXfN40Wh5jeCCspj4jNsWiYhljjIbrEj300g8RUT2U0
 FcEoiV7AjJWWQ5pi8lZJX6nmB0lc69Jw03V6mblgeZ/1oTZmOepkagwy2zLDXxihf0GowUif
 GphBDeP8elWBNK+ajl5rmpAMNRoKxpN/xR4NzBg62AjyIvigdywa1RehSTfccQARAQABwsBf
 BBgBAgAJBQJNWQbPAhsMAAoJEBaat7Gkz/iuteIH+wZuRDqK0ysAh+czshtG6JJlLW6eXJJR
 Vi7dIPpgFic2LcbkSlvB8E25Pcfz/+tW+04Urg4PxxFiTFdFCZO+prfd4Mge7/OvUcwoSub7
 ZIPo8726ZF5/xXzajahoIu9/hZ4iywWPAHRvprXaim5E/vKjcTeBMJIqZtS4u/UK3EpAX59R
 XVxVpM8zJPbk535ELUr6I5HQXnihQm8l6rt9TNuf8p2WEDxc8bPAZHLjNyw9a/CdeB97m2Tr
 zR8QplXA5kogS4kLe/7/JmlDMO8Zgm9vKLHSUeesLOrjdZ59EcjldNNBszRZQgEhwaarfz46
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <10134f03-3bb9-072b-a70f-edc972f7bf57@baylibre.com>
Date: Mon, 7 Sep 2020 10:02:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200701143131.841-1-yannick.fertre@st.com>
Content-Language: en-US
Subject: Re: [Linux-stm32] [PATCH] drm/bridge/synopsys: dsi: allow sending
 longer LP commands
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

On 01/07/2020 16:31, Yannick Fertre wrote:
> From: Antonio Borneo <antonio.borneo@st.com>
> 
> Current code does not properly computes the max length of LP
> commands that can be send during H or V sync, and rely on static
> values.
> Limiting the max LP length to 4 byte during the V-sync is overly
> conservative.
> 
> Relax the limit and allows longer LP commands (16 bytes) to be
> sent during V-sync.
> 
> Signed-off-by: Antonio Borneo <antonio.borneo@st.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> index d580b2aa4ce9..1a24ea648ef8 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -360,6 +360,15 @@ static void dw_mipi_message_config(struct dw_mipi_dsi *dsi,
>  	bool lpm = msg->flags & MIPI_DSI_MSG_USE_LPM;
>  	u32 val = 0;
>  
> +	/*
> +	 * TODO dw drv improvements
> +	 * largest packet sizes during hfp or during vsa/vpb/vfp
> +	 * should be computed according to byte lane, lane number and only
> +	 * if sending lp cmds in high speed is enable (PHY_TXREQUESTCLKHS)
> +	 */
> +	dsi_write(dsi, DSI_DPI_LP_CMD_TIM, OUTVACT_LPCMD_TIME(16)
> +		  | INVACT_LPCMD_TIME(4));
> +
>  	if (msg->flags & MIPI_DSI_MSG_REQ_ACK)
>  		val |= ACK_RQST_EN;
>  	if (lpm)
> @@ -611,14 +620,6 @@ static void dw_mipi_dsi_dpi_config(struct dw_mipi_dsi *dsi,
>  	dsi_write(dsi, DSI_DPI_VCID, DPI_VCID(dsi->channel));
>  	dsi_write(dsi, DSI_DPI_COLOR_CODING, color);
>  	dsi_write(dsi, DSI_DPI_CFG_POL, val);
> -	/*
> -	 * TODO dw drv improvements
> -	 * largest packet sizes during hfp or during vsa/vpb/vfp
> -	 * should be computed according to byte lane, lane number and only
> -	 * if sending lp cmds in high speed is enable (PHY_TXREQUESTCLKHS)
> -	 */
> -	dsi_write(dsi, DSI_DPI_LP_CMD_TIM, OUTVACT_LPCMD_TIME(4)
> -		  | INVACT_LPCMD_TIME(4));
>  }
>  
>  static void dw_mipi_dsi_packet_handler_config(struct dw_mipi_dsi *dsi)
> 


Tested on Amlogic AXG (v1.21a)

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Applying to drm-misc-next

Thanks !
Neil
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

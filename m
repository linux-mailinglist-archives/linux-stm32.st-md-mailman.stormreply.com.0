Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AAC294899
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Oct 2020 09:04:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A606AC424C3;
	Wed, 21 Oct 2020 07:04:41 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0525CC424B7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Oct 2020 15:14:34 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id x7so14404065eje.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Oct 2020 08:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=k5HKd5Dvm+PlmQWNtjdNQ6J81HIZ/9KCp/3Jwtpcssc=;
 b=ddobrC7lYIkh7S1IKtscl3NNuKCvcMX6IEgHPwvFIZFbsHW4OfZYYazaUnaKzPRVIK
 CKU55gIYVcM/9FHaGMvlFxzC1r2huOZ8mjBXjYP2CWqxDyBuXsEVCDxmxIDIPeExSJRY
 OghIyHdkCsSD8KXiWcdXiLtCydIbCHHOJ+Lb6BoSfkNj1gTQ/Q2qLc0SZ1uyUZ5hI9c1
 hRx8Knlort1CVMhBFspVp7+clQ3/KKbWBawK1lA2CaHxeKLV3Oo5OsCSZIrmkPNtN/ju
 vLkN1t2T0QuvTehhSdKZWoUV34OHlS9pT6FncMqh6nWdXKqMLIH4i8YFAtqH5RnZY2R+
 h7hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k5HKd5Dvm+PlmQWNtjdNQ6J81HIZ/9KCp/3Jwtpcssc=;
 b=Wi81zWTAAZMR3p5rrzE7KXsudbEOE+x0B/C6RmKbyYyXtmWNEBEhZzgqaGkwU7p5rH
 ux8zfggPDN3kAYm54xKCajwFdlapV86fjJEBzKrDEyKhhLmBr/rVQaN6A8spNMAZL6wB
 1yOmyW+TwvW2Exlqt2JlPC3Hx5K6G0YW+qq2F0ZYThDVoNsh91dvphUVM7ZO/VrPjsB+
 +6NlYMyJIk0QjA8I0ctS0UsL+jz6+HjD+O2DedI1JFVEMfvERBtgYZsIwBlgyUMpPjrF
 gK9cKX9prWuGT9sj02uuaaj6xjwTReA37PKX0LlApI2YZUze9s7U9bW9hbT1GRvvKCVR
 gTog==
X-Gm-Message-State: AOAM533RFNPRDGaz2rIxeb1RrZsGTcPSHGGeGYIzKArcmSJpli9WmKVa
 4U/WL35eSdbPzBTAsL4lun2CKN4xu2heUA==
X-Google-Smtp-Source: ABdhPJwkNiFb2lN6FLk3b7+NSS9qfzUjlDcr/p+hf7yimWmeWx7m0sBipByrZWa1e5cRwwxLpQM3Ig==
X-Received: by 2002:a17:906:8c6:: with SMTP id o6mr369350eje.304.1603120474210; 
 Mon, 19 Oct 2020 08:14:34 -0700 (PDT)
Received: from debian64.daheim (pd9e29b8a.dip0.t-ipconnect.de.
 [217.226.155.138])
 by smtp.gmail.com with ESMTPSA id a19sm11494812edb.84.2020.10.19.08.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 08:14:33 -0700 (PDT)
Received: from localhost.daheim ([127.0.0.1])
 by debian64.daheim with esmtp (Exim 4.94)
 (envelope-from <chunkeey@gmail.com>)
 id 1kUWro-0009z5-4Z; Mon, 19 Oct 2020 17:14:32 +0200
To: trix@redhat.com, kvalo@codeaurora.org, davem@davemloft.net,
 kuba@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 ath9k-devel@qca.qualcomm.com, johannes.berg@intel.com,
 emmanuel.grumbach@intel.com, luciano.coelho@intel.com, linuxwifi@intel.com,
 chunkeey@googlemail.com, pkshih@realtek.com, sara.sharon@intel.com,
 tova.mussai@intel.com, nathan.errera@intel.com, lior2.cohen@intel.com,
 john@phrozen.org, shaul.triebitz@intel.com, shahar.s.matityahu@intel.com,
 Larry.Finger@lwfinger.net, zhengbin13@huawei.com,
 christophe.jaillet@wanadoo.fr, yanaijie@huawei.com, joe@perches.com,
 saurav.girepunje@gmail.com
References: <20201019150507.20574-1-trix@redhat.com>
From: Christian Lamparter <chunkeey@gmail.com>
Message-ID: <b31478ea-979a-1c9c-65db-32325233a715@gmail.com>
Date: Mon, 19 Oct 2020 17:14:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <20201019150507.20574-1-trix@redhat.com>
Content-Language: de-DE
X-Mailman-Approved-At: Wed, 21 Oct 2020 07:04:33 +0000
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] wireless: remove unneeded break
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

On 19/10/2020 17:05, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> A break is not needed if it is preceded by a return or goto
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

> diff --git a/drivers/net/wireless/intersil/p54/eeprom.c b/drivers/net/wireless/intersil/p54/eeprom.c
> index 5bd35c147e19..3ca9d26df174 100644
> --- a/drivers/net/wireless/intersil/p54/eeprom.c
> +++ b/drivers/net/wireless/intersil/p54/eeprom.c
> @@ -870,7 +870,6 @@ int p54_parse_eeprom(struct ieee80211_hw *dev, void *eeprom, int len)
>   			} else {
>   				goto good_eeprom;
>   			}
> -			break;
Won't the compiler (gcc) now complain about a missing fallthrough annotation?
>   		default:
>   			break;
>   		}

Cheers,
Christian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

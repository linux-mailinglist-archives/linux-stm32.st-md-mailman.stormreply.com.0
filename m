Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17332292AD9
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Oct 2020 17:51:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC1F0C424B8;
	Mon, 19 Oct 2020 15:51:07 +0000 (UTC)
Received: from gateway22.websitewelcome.com (gateway22.websitewelcome.com
 [192.185.47.79])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5B41C424B3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Oct 2020 15:51:04 +0000 (UTC)
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
 by gateway22.websitewelcome.com (Postfix) with ESMTP id 0D92216BFA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Oct 2020 10:50:40 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id UXOpkArkZCjCVUXOpkTpmt; Mon, 19 Oct 2020 10:48:39 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=odJYZ9d0+pjHgZgCva+iMZ6Ry5+QIMVMpj0o527LzrE=; b=sx2pnmhRmXpWfy+BTimwNrB9En
 qtwHG90seMXXta/v0Oiv85QNzOQANQNlT3MgbNHgPtA6diKkgJFli75nORi0rBPrBAPWihBkf0slT
 +zBYi0fXiGj6IaqW41jn24pVXd2hfslvaoGLlQYBqH6mTJXaTaoHlNKy5RabvhmQ0i4KmyInP5gdp
 aT45U7L/ROdhNYYvnGu/8dWGzIxLNQiDcWlhQgpt9TXNKUXzul2427yOUQ/+f/HdzjrrJrRfk6nH1
 3+44d/uFwdfDvLizRhOQiisEs86cQ//CcFZsM5VBLUVy9VIq/7EZnl41a0hHzfPb/1fG5ZakfIOGp
 smj2xjFA==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:59474
 helo=[192.168.15.4])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <gustavo@embeddedor.com>)
 id 1kUXOo-001bx0-4u; Mon, 19 Oct 2020 10:48:38 -0500
To: Joe Perches <joe@perches.com>, Christian Lamparter <chunkeey@gmail.com>,
 trix@redhat.com, kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 ath9k-devel@qca.qualcomm.com, johannes.berg@intel.com,
 emmanuel.grumbach@intel.com, luciano.coelho@intel.com, linuxwifi@intel.com,
 chunkeey@googlemail.com, pkshih@realtek.com, sara.sharon@intel.com,
 tova.mussai@intel.com, nathan.errera@intel.com, lior2.cohen@intel.com,
 john@phrozen.org, shaul.triebitz@intel.com, shahar.s.matityahu@intel.com,
 Larry.Finger@lwfinger.net, zhengbin13@huawei.com,
 christophe.jaillet@wanadoo.fr, yanaijie@huawei.com,
 saurav.girepunje@gmail.com
References: <20201019150507.20574-1-trix@redhat.com>
 <b31478ea-979a-1c9c-65db-32325233a715@gmail.com>
 <859112e91c3d221dc599e381dbaecb90dd6467a1.camel@perches.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Autocrypt: addr=gustavo@embeddedor.com; keydata=
 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
 AP7RWS474w==
Message-ID: <fb38b96a-b666-1a6d-211d-b79278a8d878@embeddedor.com>
Date: Mon, 19 Oct 2020 10:54:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <859112e91c3d221dc599e381dbaecb90dd6467a1.camel@perches.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - st-md-mailman.stormreply.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1kUXOo-001bx0-4u
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.4])
 [187.162.31.110]:59474
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 33
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 10/19/20 10:21, Joe Perches wrote:
> On Mon, 2020-10-19 at 17:14 +0200, Christian Lamparter wrote:
>> On 19/10/2020 17:05, trix@redhat.com wrote:
>>> From: Tom Rix <trix@redhat.com>
>>>
>>> A break is not needed if it is preceded by a return or goto
>>>
>>> Signed-off-by: Tom Rix <trix@redhat.com>
>>> diff --git a/drivers/net/wireless/intersil/p54/eeprom.c b/drivers/net/wireless/intersil/p54/eeprom.c
>>> index 5bd35c147e19..3ca9d26df174 100644
>>> --- a/drivers/net/wireless/intersil/p54/eeprom.c
>>> +++ b/drivers/net/wireless/intersil/p54/eeprom.c
>>> @@ -870,7 +870,6 @@ int p54_parse_eeprom(struct ieee80211_hw *dev, void *eeprom, int len)
>>>   			} else {
>>>   				goto good_eeprom;
>>>   			}
>>> -			break;
>> Won't the compiler (gcc) now complain about a missing fallthrough annotation?

Clang would definitely complain about this.

>>>   		default:
>>>   			break;
>>>   		}
> 
> No, though the code would be clearer like:
> ---
> diff --git a/drivers/net/wireless/intersil/p54/eeprom.c b/drivers/net/wireless/intersil/p54/eeprom.c
> index 5bd35c147e19..233fa072d96d 100644
> --- a/drivers/net/wireless/intersil/p54/eeprom.c
> +++ b/drivers/net/wireless/intersil/p54/eeprom.c
> @@ -867,10 +867,8 @@ int p54_parse_eeprom(struct ieee80211_hw *dev, void *eeprom, int len)
>  					 "test!\n");
>  				err = -ENOMSG;
>  				goto err;
> -			} else {
> -				goto good_eeprom;
>  			}
> -			break;
> +			goto good_eeprom;
>  		default:
>  			break;
>  		}
> 
> 

This is much better because it'd avoid any complain from Clang.

--
Gustavo


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

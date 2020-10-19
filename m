Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA25C294892
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Oct 2020 09:04:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79CB4C424C9;
	Wed, 21 Oct 2020 07:04:38 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B871EC424B7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Oct 2020 16:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603125412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=optKrY6Tp1RPYaBRN356KcYJ+2/Ack/4GYTANB8xPp4=;
 b=f2Nhl8xSuo9pOpT0p+JAuUgyUPVskl/rA1lY5HDryOuV1ysHd9TPCuZNMK4Qo7MJ2BtFJO
 BmWljWijK3s8wsm9ZXNYRyUoIgmpBkbCUc1qYDsPabtjQh7mdlHNHHNf0Uqf3NTY30Qw7V
 1YZokmO/nADLmQRWS1moXQ1iJL4mAGQ=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-DueJg79JMZuBIH2EgrW4vw-1; Mon, 19 Oct 2020 12:36:50 -0400
X-MC-Unique: DueJg79JMZuBIH2EgrW4vw-1
Received: by mail-qt1-f198.google.com with SMTP id t40so300578qtc.19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Oct 2020 09:36:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=RJ9s8xaYxYBkmCjGVLRdfk2kyqkECbsbWamfUa+vQoA=;
 b=iB9hJPny/c1ysN6LdIya8NWsHElxA/+e59waM/1OF1wmM+VCCAXx1ine+ULPVk7Mha
 YTorSsREH8gqewOl8NNGSRDghy078O5+VWvbBaIaG6CCU9aNb/QuSq9Slx1fWAZVzTH6
 m+iVSwhJPSi/Jdwmg7/CpaXDgb8+2REVRBowbnlo2GQ5OBIg/OBl3M3u0W32MKJ+PiEW
 tSRh8KhmA41JcnHEsMfwQRVrqSywpfq35Q4b9hiiQULks5OqTns1dFmy4vyGy3S8ZSjU
 Aqjm1T4oQ+9c7Um/8ep19dV84fQInPHl5HhJNea0aUaqgS470lbpjmarf7xDRd4bCLSr
 x7wA==
X-Gm-Message-State: AOAM532s9pdaAPrkk9QXW45JwKHGDoic//tLUDWVHODPzZp+n7Wozf0c
 PZZMMqlYA6spc/V+YWoOmmBJtIHXR5RVnyYdqibpmrrhFMfnDUH1eprwTYRNrCPGCSDmgEgkqDv
 c03/hHTJYyOcO3Wtld07UMXjwW7NXsmfTNguZgz6l
X-Received: by 2002:a37:648d:: with SMTP id y135mr385735qkb.115.1603125410136; 
 Mon, 19 Oct 2020 09:36:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsvts5SeTR8WovKOLGInNhGSr3+dLgLMhsproUZSM6Q195eZXi9N1XbqSQsptRTh4xrVpRQA==
X-Received: by 2002:a37:648d:: with SMTP id y135mr385688qkb.115.1603125409803; 
 Mon, 19 Oct 2020 09:36:49 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id v39sm154809qtk.81.2020.10.19.09.36.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Oct 2020 09:36:49 -0700 (PDT)
To: Joe Perches <joe@perches.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Christian Lamparter <chunkeey@gmail.com>, kvalo@codeaurora.org,
 davem@davemloft.net, kuba@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com, ath9k-devel@qca.qualcomm.com,
 johannes.berg@intel.com, emmanuel.grumbach@intel.com,
 luciano.coelho@intel.com, linuxwifi@intel.com, chunkeey@googlemail.com,
 pkshih@realtek.com, sara.sharon@intel.com, tova.mussai@intel.com,
 nathan.errera@intel.com, lior2.cohen@intel.com, john@phrozen.org,
 shaul.triebitz@intel.com, shahar.s.matityahu@intel.com,
 Larry.Finger@lwfinger.net, zhengbin13@huawei.com,
 christophe.jaillet@wanadoo.fr, yanaijie@huawei.com,
 saurav.girepunje@gmail.com
References: <20201019150507.20574-1-trix@redhat.com>
 <b31478ea-979a-1c9c-65db-32325233a715@gmail.com>
 <859112e91c3d221dc599e381dbaecb90dd6467a1.camel@perches.com>
 <fb38b96a-b666-1a6d-211d-b79278a8d878@embeddedor.com>
 <5964d734e81c198421bb7f6516dabcad37c1740d.camel@perches.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <1c358ade-abdf-e4f2-2207-9f4887e90f05@redhat.com>
Date: Mon, 19 Oct 2020 09:36:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <5964d734e81c198421bb7f6516dabcad37c1740d.camel@perches.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Mailman-Approved-At: Wed, 21 Oct 2020 07:04:31 +0000
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


On 10/19/20 9:20 AM, Joe Perches wrote:
> On Mon, 2020-10-19 at 10:54 -0500, Gustavo A. R. Silva wrote:
>> On 10/19/20 10:21, Joe Perches wrote:
>>> On Mon, 2020-10-19 at 17:14 +0200, Christian Lamparter wrote:
>>>> On 19/10/2020 17:05, trix@redhat.com wrote:
>>>>> From: Tom Rix <trix@redhat.com>
>>>>>
>>>>> A break is not needed if it is preceded by a return or goto
>>>>>
>>>>> Signed-off-by: Tom Rix <trix@redhat.com>
>>>>> diff --git a/drivers/net/wireless/intersil/p54/eeprom.c b/drivers/net/wireless/intersil/p54/eeprom.c
> []
>>>>> @@ -870,7 +870,6 @@ int p54_parse_eeprom(struct ieee80211_hw *dev, void *eeprom, int len)
>>>>>   			} else {
>>>>>   				goto good_eeprom;
>>>>>   			}
>>>>> -			break;
>>>> Won't the compiler (gcc) now complain about a missing fallthrough annotation?
>> Clang would definitely complain about this.
> As far as I can tell, clang 10.0.0 doesn't complain.
>
> This compiles without fallthrough complaint
>
> from make V=1 W=123 CC=clang drivers/net/wireless/intersil/p54/eeprom.o
> with -Wimplicit-fallthrough added
>
> $ clang -Wp,-MMD,drivers/net/wireless/intersil/p54/.eeprom.o.d  -nostdinc -isystem /usr/local/lib/clang/10.0.0/include -I./arch/x86/include -I./arch/x86/include/generated  -I./include -I./arch/x86/include/uapi -I./arch/x86/include/generated/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linux/kconfig.h -include ./include/linux/compiler_types.h -D__KERNEL__ -Qunused-arguments -DKBUILD_EXTRA_WARN1 -DKBUILD_EXTRA_WARN2 -DKBUILD_EXTRA_WARN3 -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=implicit-function-declaration -Werror=implicit-int -Wno-format-security -std=gnu89 -no-integrated-as -Werror=unknown-warning-option -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m64 -mno-80387 -mstack-alignment=8 -mtune=generic -mno-red-zone -mcmodel=kernel -DCONFIG_X86_X32_ABI -Wno-sign-compare -fno-asynchronous-unwind-tables -mretpoline-external-thunk -fno-delete-null-pointer-checks -Wno-address-of-packed-m
 ember -O2 -Wframe-larger-than=2048 -fstack-protector-strong -Wno-format-invalid-specifier -Wno-gnu -mno-global-merge -Wno-unused-const-variable -ftrivial-auto-var-init=pattern -pg -mfentry -DCC_USING_FENTRY -falign-functions=32 -Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wno-array-bounds -fno-strict-overflow -fno-stack-check -Werror=date-time -Werror=incompatible-pointer-types -fcf-protection=none -Wextra -Wunused -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-attribute -Wmissing-prototypes -Wold-style-definition -Wmissing-include-dirs -Wunused-const-variable -Wno-missing-field-initializers -Wno-sign-compare -Wno-type-limits -Wcast-align -Wdisabled-optimization -Wnested-externs -Wshadow -Wmissing-field-initializers -Wtype-limits -Wunused-macros -Wbad-function-cast -Wcast-qual -Wconversion -Wpacked -Wpadded -Wpointer-arith -Wredundant-decls -Wsign-compare -Wswitch-default     -fsanitize=kernel-address -mllvm -asan-mapping-offset=0xdffffc0000000000  -mllvm -a
 san-globals=1  -mllvm -asan-instrumentation-with-call-threshold=0  -mllvm -asan-stack=0   --param asan-instrument-allocas=1   -fsanitize-coverage=trace-pc -fsanitize-coverage=trace-cmp -Wimplicit-fallthrough    -DKBUILD_MODFILE='"drivers/net/wireless/intersil/p54/p54common"' -DKBUILD_BASENAME='"eeprom"' -DKBUILD_MODNAME='"p54common"' -c -o drivers/net/wireless/intersil/p54/eeprom.o drivers/net/wireless/intersil/p54/eeprom.c
>
I did not intend for if-else; break; changes to be in the patchset.

I will kick this out and respin the patch after i get the first pass of the other changes out.

Sorry,

Tom


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

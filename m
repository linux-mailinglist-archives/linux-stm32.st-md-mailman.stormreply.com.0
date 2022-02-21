Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D02114BD76D
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Feb 2022 09:12:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 811D0C6046B;
	Mon, 21 Feb 2022 08:12:10 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A81AC60461
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Feb 2022 08:12:09 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id m14so17080876lfu.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Feb 2022 00:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AMtyamgl5K/9e9QFxnyeso28NW8FhnQybeCPePa6FPk=;
 b=ZF+/+gAukbkASqH8KQFBW49EAEI8jemBYStwFZWE1iAoiEbOewEt695Po5tGz9XBiI
 lqpJq1zUwdVbFLRbTUvG5/AafkIzNvaiMNrxEWI6P4P3UYA6OnREn5cQMgQIPoQi9ewZ
 Pk3DOYx3/O+HdSelBws4mzMZqBFNcUaw7oD7JIdYpKJ2L3F8zp+f9e7mPcJhYBjr85Rd
 mdNDde9WHLOOXS9RcdU2r5U2G+lC7rdcMJdbBBnqJ4hAdnxlkb8wpTi6AwH2q6vuj1IF
 f8U1CdfcmJHsxbIwv+ph10VwWGLcr2TsTUcOfFUxQrmNgubRPKv+UQJ5lQ33YJFdqqon
 Z2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AMtyamgl5K/9e9QFxnyeso28NW8FhnQybeCPePa6FPk=;
 b=Z9LdxfUzGnX1ezPiQjrau0RIL51CTbN80DL7cpGUl0QUnXEGZGzTQw2dReaeYoenJ3
 WQ3aBjlgws3UIP0XeLULCeWmTIDYp5fYewHcPyVudhT8ZRiuccoVxl0f4nq/6wNYfZX5
 x4M30sA3Uz60ttc/bG8mX0vyBeYQC64YFpV/BAZiYvoRDLzl4WA1v0Wc8Kd68/DbGPlw
 w4IrPBuObHgKBYCbG3RCL2FIW3Pg/f7TVlwzMhlb153CjM1HJnGtG1dG3vGEF01FnWjh
 hToIjFkMTfEd94ESL94NqVX5wJjc3T01t+iuauyV9gsu4xiaH7Fsm1jqrANfHy+KNPCD
 W/Lg==
X-Gm-Message-State: AOAM533WD0amWC5QA86STjiMEFRaX3um7jpLcFQSDluVuYIl9ZHSIvIE
 BXlp2CAiYcMC5Zy6Pd19GFg=
X-Google-Smtp-Source: ABdhPJywWtoHMTPRyDz+QDtD+lHOHcedBIWHiNA0i4m70aAvOHhtTX3ZJW2OLMRA4O6iGfpngKtM1w==
X-Received: by 2002:a05:6512:230d:b0:443:972f:fd7e with SMTP id
 o13-20020a056512230d00b00443972ffd7emr13460544lfu.322.1645431128461; 
 Mon, 21 Feb 2022 00:12:08 -0800 (PST)
Received: from [192.168.1.11] ([94.103.229.64])
 by smtp.gmail.com with ESMTPSA id t20sm1036483lfe.277.2022.02.21.00.12.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 00:12:08 -0800 (PST)
Message-ID: <43992c7a-c8e7-29a6-d0f0-f69abccd62a1@gmail.com>
Date: Mon, 21 Feb 2022 11:12:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-US
To: Jiri Kosina <jikos@kernel.org>
References: <000000000000d181a205d874c066@google.com>
 <cd08c05f-f648-071f-d8f5-0a022cd35b7b@gmail.com>
 <nycvar.YFH.7.76.2202210900420.11721@cbobk.fhfr.pm>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <nycvar.YFH.7.76.2202210900420.11721@cbobk.fhfr.pm>
Cc: syzbot <syzbot+35eebd505e97d315d01c@syzkaller.appspotmail.com>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 alexandre.torgue@foss.st.com, benjamin.tissoires@redhat.com,
 mcoquelin.stm32@gmail.com, linux-input@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [syzbot] KASAN: slab-out-of-bounds Read in
	thrustmaster_probe
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

Hi Jiri,

On 2/21/22 11:01, Jiri Kosina wrote:
>> Looks like missing check for malicious device. Need to check number of
>> endpoints before accessing endpoints array
>> 
>> 
>> #syz test
>> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> 
> Thanks Pavel. Could you please send the patch with proper changelog and
> SOB my way?
> 

I've already posted the patch :) You can find it here [1] (you are in CC 
of course)



[1] 
https://lore.kernel.org/all/20220220160114.26882-1-paskripkin@gmail.com/




With regards,
Pavel Skripkin
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

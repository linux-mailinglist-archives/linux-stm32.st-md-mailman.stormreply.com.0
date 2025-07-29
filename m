Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D45F1B15FBE
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Jul 2025 13:48:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8FF25C3F944;
	Wed, 30 Jul 2025 11:48:12 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 658B1C32E92
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Jul 2025 22:01:48 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-4ab5953f5dcso58283941cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Jul 2025 15:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753826507; x=1754431307;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=MWallFmHDs9ZWDkZSi+x55d0KJtII8ohAMcXEHud3xg=;
 b=dD0qO3NXpmdi/Y5ocdV6FWMO1IaAYdFOsMtBecgTzy4vnjUQ92FnaHLwnL5oE3wo9d
 KqttWHLMyZcdC4pelaR/chCRP85mt/s9LHjdglYt1dfEFA9/6oKmA/R6tWeJgr2LvZor
 SIkQYkJrLnYAfb7liyD/ElHzFtYBvrqGq29eXRQUBjnnMWmWFI8y/Gp9ou2UVOwMhFdv
 nWBPSrQRGm/C9fmokLYX7YSFCyDaAeJiyouE40YTML8jECAifmOACHHBKq04dyP4wzRW
 maCjIRe0WytwdBZwQFxvoj6BI6I1b1tSc7sYav4HxvmL6sJhQUZHdEOSuNdGTJ+3Z6Ul
 9slw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753826507; x=1754431307;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MWallFmHDs9ZWDkZSi+x55d0KJtII8ohAMcXEHud3xg=;
 b=D6M2n96Z+w9/rvCoF2p8tZM34tsYJ6Xsn8uRQUrMnjjIz0ko4dQNcqhbEvASh+5Qod
 RUto2ThthL+lFnP5U0A2F2hY6JX50oWU0n/Nz4BwvODLt94f1hWVsjcouwZuBu9YHQAK
 rke+g0nal3/YDU4aEaARDyk7O+uoQng2UwuUOA2Bc+FUSe7Rhjj8wmTX9mxduRILGulL
 9MUiXxyp13KqFHCE/zko6uOSHbNPcBjgfikACbPVyTIPm2eE5E+60YwLNQ6heyvtnyIy
 BiiZ3HFLrmiwDVoMBLzwrV1nZwFGNL8iNheVZr/RFPKZD4QTMh8OcXnkUx4lBCod0vum
 o9pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxJWvDyX0hXbrsIVhmfiVTtua07p62LscK+9SuIZ4aGNCknXYn504cuisHh0nahDA6s3VUlmidhTXniA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwkNDKvj1J5/6wg80h7aE8dxhtLJJbtG7JXq59UOfhsjlnDVk8R
 3kBzPBHX4DCiDobkwUSbOhxejVoBowrDEDoKc/PSGt7V3bKzgRbxKc/X
X-Gm-Gg: ASbGncvFts+je4TgwLIgdYSz1sgWro/M0i7iJkRNpDdZJW7EGi7CbzjucgLkpACIrG6
 U3FS+hPKDJqv1dfO70rZpeJvi/KmmcOL4TNJG8ZcHQFB11eMVj6p0ZzHjzjnZza6LD10Ee9Dzi7
 KFwAOqN5x/Z3Dbtgfr2dtEdh5IsRb1eJ1rZTQUk6TrWFjI8/Vaqk/Tk8FKLxLSzow2QD9gq5zMe
 8yurg5kd0qfeJd/X0d+gRpaC1tfLzOCCxhjAFGWTb1FMmtZ8IwYox1YbCN1ZkizwswHQ+JuNKHt
 67Txi1zxEG4xrMuykdmfKZgMyFoa9xaxmWLrsWj0Jxazmc5hQ1kdIN+fSMHQ7Ze3IVW+Ae+P7mx
 zLN/XJXc3sTbL3p9nwbBlkudzztoKNFCDLzDSRdU3RJ0ymQ68reTkDxagk291pnjZ+kzrNGw=
X-Google-Smtp-Source: AGHT+IEvdcCG0w/+CuXlf8z4cdBDzm/VOuFAHwLTBB4uMWUEHDzTj5mE8m3z3Zn7Qfciq2gbGNvUqA==
X-Received: by 2002:a05:622a:15d1:b0:4ab:5888:38fb with SMTP id
 d75a77b69052e-4aedbc3afb2mr21371981cf.32.1753826506905; 
 Tue, 29 Jul 2025 15:01:46 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ae9966e30csm55570921cf.55.2025.07.29.15.01.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 15:01:45 -0700 (PDT)
Message-ID: <5f68f153-c633-45da-96cc-113482e0b6d1@gmail.com>
Date: Tue, 29 Jul 2025 15:01:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
References: <eaef1b1b-5366-430c-97dd-cf3b40399ac7@lunn.ch>
 <aIe5SqLITb2cfFQw@shell.armlinux.org.uk>
 <77229e46-6466-4cd4-9b3b-d76aadbe167c@foss.st.com>
 <aIiOWh7tBjlsdZgs@shell.armlinux.org.uk>
 <aIjCg_sjTOge9vd4@shell.armlinux.org.uk>
 <d300d546-09fa-4b37-b8e0-349daa0cc108@foss.st.com>
 <aIjePMWG6pEBvna6@shell.armlinux.org.uk>
 <186a2265-8ca8-4b75-b4a2-a81d21ca42eb@foss.st.com>
 <aIj4Q6WzEQkcGYVQ@shell.armlinux.org.uk>
 <b88160a5-a0b8-4a1a-a489-867b8495a88e@lunn.ch>
 <aIkQxlqmg9_EFqsI@shell.armlinux.org.uk>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 WlfRzlpjIPmdjgoicA==
In-Reply-To: <aIkQxlqmg9_EFqsI@shell.armlinux.org.uk>
X-Mailman-Approved-At: Wed, 30 Jul 2025 11:48:10 +0000
Cc: Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 6/7] net: stmmac: add helpers
 to indicate WoL enable status
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

On 7/29/25 11:19, Russell King (Oracle) wrote:
> On Tue, Jul 29, 2025 at 07:27:11PM +0200, Andrew Lunn wrote:
>> And i did notice that the Broadcom code is the only one doing anything
>> with enable_irq_wake()/disable_irq_wake(). We need to scatter these
>> into the drivers.
> 
> It's better to use devm_pm_set_wake_irq() in the probe function, and
> then let the core code (drivers/base/power/wakeup.c and
> drivers/base/power/wakeirq.c) handle it. This is what I'm doing for
> the rtl8211f.
> 
> IRQ wake gets enabled/disabled at suspend/resume time, rather than
> when the device wakeup state changes, which I believe is what is
> preferred.
> 

Sounds reasonable, I will go test that instead of doing the 
enable_irq_wake()/disable_irq_wake() dance. Thanks!
-- 
Florian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

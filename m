Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B56A1A1C62C
	for <lists+linux-stm32@lfdr.de>; Sun, 26 Jan 2025 03:40:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 531FCC78011;
	Sun, 26 Jan 2025 02:40:18 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79F4AC78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Jan 2025 02:40:10 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2165cb60719so58362845ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Jan 2025 18:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737859209; x=1738464009;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zO1ms2VfnDa4Pg68YIbyfHsBiRPVKAqT5H3D+lbdTYM=;
 b=MhNyI9HZ2h7rqLaRQa79ShsPV0KF1hhpio5+chCs6IXVSY8f209WWBwQPKJ1oUmxt9
 N5Mb5Th7w0PgadnPcNZvuY6060m5C7IExmbL+VGxOtcR8w3he4DwELsxufGBFEmAMKFj
 GHpxY6fEJV64y7QhS63ZLX5d1yiX5qJbl9gcHPuebDrZDA++/ugrQUK552+LpMEyDNxj
 Cq07P0+8osZfzAvASVIasuiSTQLkDpDTJi4F2RKxoY8w1kkQ1bw/PK57Cf0O0rQEQD8G
 nUQSqF2i2+jsJW14zXXtrGCWMu90R6abhiMODA1ZzNz/Qgb2QJbCzuHNgoxktWd4eU0E
 iaUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737859209; x=1738464009;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zO1ms2VfnDa4Pg68YIbyfHsBiRPVKAqT5H3D+lbdTYM=;
 b=xAhwf0trhpzFjomHKpUVfkfeg6LDFr4AWCVajzrPgyBnMkWLseAYJ9r4L/Hczj/ekJ
 deVsmvVI7xnUgLNwveUyLi/Rrvmc1qX8+dhdhqZ3r6RwR1yUsNet3kyFZ+WZoXA4Rr/S
 X1VU0Q1H7pV0WCQTkytYS6C4XBgM2/JUNEqGWrVVcbw87MfMMgU9mtEOuQzzez4Nw2Q4
 y7l84knp1/H+h44ODZHA+yDjNYyeoS+SOtZpI0psitZduZaEys5UGFX4ErGwOuaO/DFN
 6g6x9rMCdqyZgAdcfDvT9t2zlv0v45ONL9EJ46RUGz1aZGSZobL/ICO01Al0/Q/Wk70z
 y5Ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5eR25p9ZTVAvz9TGOMP726IMFazowB/tCGXb5zFFbaWJVMJM6c4b4CPNJ28MwZOQ7aaCgHi/5VVeXAQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw6+8ozjccinJp0XfXwkSs9vanGp4GE1XqHG8lN+M8t5Fn1kMqO
 Um7lBiNbdiRoShVTpcDKwk6bqNca7xatN/HxV5QOnZawI2iGuIG5
X-Gm-Gg: ASbGnctgAUTO4HAiaUInQ/w2yrJ0Tyae4flNLjx3YjpxHqeU3hAEPQ2QxKsxXtCE7CI
 COccIZPEDFJOnZF5amaHVL92OBsVYI1/yZD8j7Pue80dS6uA3yeB6bK60HidAXIJ6qirVCsQo6K
 XaKgHETbthTtic0BGXah07VTOb8SvlzuAer/DumaG1LxRUAUc2YMYQTOSS2ZcbzzkhIZYuBfTV/
 NbQ4lzgOd1cH8T6Pdu6kt6KB2CyQx36/oIDMyskksy4ORAiTyrwSJFxQmdPsOuCn4sY3U1SEyGj
 dQ==
X-Google-Smtp-Source: AGHT+IFsqUm3b34km4WyrcizVaYpgbqweOU0v8OuV1KGFi0lmdJUkL/Z82B1rVH2F3YAwm0jejyo5Q==
X-Received: by 2002:a05:6a20:a10c:b0:1d9:6c9c:75ea with SMTP id
 adf61e73a8af0-1eb21470203mr53454209637.5.1737859208701; 
 Sat, 25 Jan 2025 18:40:08 -0800 (PST)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72f8a761193sm4591717b3a.93.2025.01.25.18.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jan 2025 18:40:08 -0800 (PST)
Date: Sun, 26 Jan 2025 10:39:52 +0800
From: Furong Xu <0x1207@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <20250126103952.00005556@gmail.com>
In-Reply-To: <09442385-573c-4756-8c30-296631bc6272@lunn.ch>
References: <cover.1736910454.git.0x1207@gmail.com>
 <bd7aabf4d9b6696885922ed4bef8fc95142d3004.1736910454.git.0x1207@gmail.com>
 <d465f277-bac7-439f-be1d-9a47dfe2d951@nvidia.com>
 <20250124003501.5fff00bc@orangepi5-plus>
 <e6305e71-5633-48bf-988d-fa2886e16aae@nvidia.com>
 <ccbecd2a-7889-4389-977e-10da6a00391c@lunn.ch>
 <20250124104256.00007d23@gmail.com> <Z5S69kb7Qz_QZqOh@shredder>
 <20250125230347.0000187b@gmail.com>
 <09442385-573c-4756-8c30-296631bc6272@lunn.ch>
MIME-Version: 1.0
Cc: Paolo Abeni <pabeni@redhat.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>, netdev@vger.kernel.org,
 Joe Damato <jdamato@fastly.com>, linux-kernel@vger.kernel.org,
 Brad Griffis <bgriffis@nvidia.com>, Ido Schimmel <idosch@idosch.org>,
 Eric Dumazet <edumazet@google.com>, "David S.
 Miller" <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Andrew Lunn <andrew+netdev@lunn.ch>
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/4] net: stmmac: Switch to
 zero-copy in non-XDP RX path
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

On Sat, 25 Jan 2025 20:08:12 +0100, Andrew Lunn <andrew@lunn.ch> wrote:

> > It is recommended to disable the "SPH feature" by default unless
> > some certain cases depend on it. Like Ido said, two large buffers
> > being allocated from the same page pool for each packet, this is a
> > huge waste of memory, and brings performance drops for most of
> > general cases.  
> 
> I don't know this driver, but it looks like SPH is required for
> NETIF_F_GRO? Can you add this flag to hw_features, but not
> wanted_features and leave SPH disabled until ethtool is used to enable
> GRO?

SPH has its own ethtool command, stmmac driver does not implement yet.
see:
https://patchwork.kernel.org/project/netdevbpf/cover/20250114142852.3364986-1-ap420073@gmail.com/

> Are there other use cases where SPH is needed?

https://patchwork.kernel.org/project/netdevbpf/cover/20240910171458.219195-1-almasrymina@google.com/
https://patchwork.kernel.org/project/netdevbpf/cover/20250116231704.2402455-1-dw@davidwei.uk/

The stmmac driver does not support both of them, but it will someday :)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

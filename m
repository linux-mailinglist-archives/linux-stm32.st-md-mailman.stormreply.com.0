Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1718D96BF2E
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Sep 2024 15:56:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0B49C78011;
	Wed,  4 Sep 2024 13:56:01 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FC96C6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Sep 2024 15:37:58 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-70f79f75da6so1289216a34.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Sep 2024 08:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725377877; x=1725982677;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=QlygXKZtLtac8IsduiUeQAjwZY4++e9ArMd1ohYJEGw=;
 b=eIag/8F347pn63WyhK7RZQWI8hNak4W8mKkvzC/dOEeRmgUEO5RsIEPvzz0MVZNmvM
 b+b5b7ityn3YYIWiJE5AOuxCixJCcNQxvTp7pJZ5kGbmLxgZbu2iWtPm1tjZreU0HjLF
 cOtF/Zq4QiZWrJmhskKCGaZFU+FFxfl1uTTttB8c5eCrVFLE4jsGyeEDklxkcAqw85VH
 0esqylaPCxxbSOhtrMY3NDN3F9rbfdLCQTE58S5wcN3plRd4lR7hLN4lWuQqy0JB+Svo
 kEfBQToaHZqG7SsjD2/syUpbqbHzn7vGgSg9Y1Dqi1Y5THH2IoliM3Kpw969JM7Y80Zy
 UhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725377877; x=1725982677;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QlygXKZtLtac8IsduiUeQAjwZY4++e9ArMd1ohYJEGw=;
 b=lsWUI5Uvz6Rir6RkDWV2KUryE0zXYcFoS+eeL/XWDe4RZpxhLe3Nux89U0xOneKWrc
 BY893ZPgv4ma48XJEaBOjKf2skG/eXahRxLP8CI5HLXGUWzx95joBAYr8HlF/y2ChQqc
 jrNNqHH6rMvnLohT8WAx2/stteuwr57oeRZMvYurnkZFZ5BXEuDcvVWupinhzc7aBayB
 E5BHXUzStq0ZJpnif8r2Mb0KHFuk1HO3GV01turJ3Vn5CEh5vA5N8A+usOV8L1ZksPe/
 sLfqjJ0TXx61Pv9TBS5ZirraGNcpeZu2Svw+/kzafzLYAsti+hhmvqwaF0kqR0Ywt5Bp
 y+9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmvycsa1Qhgdf8TyoVBf3Nak7NTjUEHkXiomCIfGMujkglwjMR66vWc5TdSfASNTsZ9hOmQu5XpmWuGg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyX4f1tMDwKDzIeOFvfune2YAQi9kQwqLYV24UXeuguBczr6iQu
 RdPH5XTcpyN/4KU32dRhm+dxERuEDC9PjwmxnIrhqpVHI+Cb3yVqkBrWm4tewq32Eib5DX9Qlao
 b49SPBgpolW1kNwIJ/rXEUv/RQW0=
X-Google-Smtp-Source: AGHT+IHcjASktMcIW6mBViWmqsXJAsudaIDLInpRVtssAI3Em5toGpTVqB8HXzYnpfc4dMdaEYiXfbzlAiYFbVJq7/U=
X-Received: by 2002:a05:6830:2d89:b0:70f:77c6:d5d1 with SMTP id
 46e09a7af769-70f77c6d7famr10493938a34.19.1725377877327; Tue, 03 Sep 2024
 08:37:57 -0700 (PDT)
MIME-Version: 1.0
From: AdamAlayna GoodFrench <aceanomadamalaynaace38@gmail.com>
Date: Tue, 3 Sep 2024 10:37:43 -0500
Message-ID: <CANi2krX7XgS+hYciVNaWL499JZYROxc8h+VG8dSYB6zxNOJaiA@mail.gmail.com>
To: christian.bruel@foss.st.com
X-Mailman-Approved-At: Wed, 04 Sep 2024 13:56:00 +0000
Cc: kishon@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, robh@kernel.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, mcoquelin.stm32@gmail.com, linux-phy@lists.infradead.org,
 krzk+dt@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 0/5] Add STM32MP25 USB3/PCIE COMBOPHY
	driver
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
Content-Type: multipart/mixed; boundary="===============1860839074258330407=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============1860839074258330407==
Content-Type: multipart/alternative; boundary="0000000000007b45c7062138d7a0"

--0000000000007b45c7062138d7a0
Content-Type: text/plain; charset="UTF-8"



--0000000000007b45c7062138d7a0
Content-Type: text/html; charset="UTF-8"

<div dir="auto"></div>

--0000000000007b45c7062138d7a0--

--===============1860839074258330407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1860839074258330407==--

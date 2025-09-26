Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FE2BA3E00
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Sep 2025 15:25:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11AABC3FADA;
	Fri, 26 Sep 2025 13:25:32 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35ACDC3FAD9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Sep 2025 13:25:30 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id
 e9e14a558f8ab-427621906faso3049345ab.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Sep 2025 06:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758893129; x=1759497929;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xfmtM7RZ7AOffVFIOIyywezf5nzzWk/ab7a+2RFSGKs=;
 b=BLuH/riKyJr4q9lMSbxE2xdTYeFaGhEFEgHQgu9w8jucidJqUkYfcD0tsPL74L1Byx
 9MhOvgdaAVquNRr348uACnKZMmdEeA+f2vZSsOVD2Ojwslfg5XUEP+tB4zO+M+T6McZH
 X7afQRuGYlWFEKz5EapuZNko6KCpCDWhnPmlTIRe18Ia5SVapbddMTMbHKbEurZNshcG
 9w/VZmiEDSzEXfwg3buLLgBmvnrrmmtSkejlbgFTGUw09HQZyJ8zn/zttqxL+AeIL+3h
 QXtUmFhZ9iUakCntBDzsnfIktSHGi+PVLG83dCdeVCPeddbZhJn+5F2ckj+7G7VkIv4t
 H/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758893129; x=1759497929;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xfmtM7RZ7AOffVFIOIyywezf5nzzWk/ab7a+2RFSGKs=;
 b=k1/yj3NNCjIvSpG78qeJxZMYTYHdWI+5nUqb6zpYK8GuukdGXOcAqWilfYFmqHMh3H
 r8G/RjsEtRy2vQRvYGgXpfjMMXp9xPMY6cjVQuDPM82qpTx7GiSdXs6gg4Fh6+HlUDHg
 +gxuKkH/uVOdHmrEirdnnlKk1a93V7vfuYp/WSCzUeeUsZM37TB+u9O9lCT/zz69Xjm1
 Ii/U2bdOzL+1k80JvWxA0gJBlnFjfxBmhKfNP2/DPw74xtmnJvKkuCTGEJn6vEUCUb7g
 bJ6knbURFajJYIYW03Cd82vGWVROI8X2WtOB9Exsne9/SKtkaK7uIYVkT7LrV5MRy1kW
 thPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxa8gj+UjQF27WlYGyQEnH05Ya3nj4p3Zjwdi3XC9U3cSG4cQo3dYV37VrSISARMjhjrqBqKsRbKXcYg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzmXW/H7KwvGT9veYGkDle10dVHhtwpnB+9hveH2cghPOGBxVAW
 u3UIYSZzwBKdX1HIMkj3cIK2I7zAv73O5QR+HZ2jUvGQfpe7LiePD/RB
X-Gm-Gg: ASbGncvZJ3RK/Da9nAiGog9yuawOtLyMpd/AKxJ4oR08JXGgF3V+WipGI0MtHi98Khs
 YbO+FZO/vzL7NulZCDcWiPIiYeIgDDdC15AKDMUE7WA3qp8E30m2wTCj+luyMdOC6XfR1pY5Bj6
 b4lam1Fon9PfAQixygrErMw8sj1pU9aP58c7Nl48xqbo5PPtL7q+LGpA3ctd/QdraSTcldC5PbJ
 ijUxjzRfDMvgtGAegwYWjkKDQjPcZkFdV49/3MHciiQvdBPqLnba2CIO3qVwp/CqhIlsBpBJT9+
 SFG0bhAqZbEGbSvt6oUllFlpdD8RAixCEgisqifzugcuCOrWS1GNeIc8WfCMaP4CIHIVNwPAbHU
 GKjPcPgUmg7jJbcapW0DwsOHqfaUDf3vv
X-Google-Smtp-Source: AGHT+IHuN12QnqYCBArnyQoijmnt/uUh4vZpuhcsJapYpJzRJKR3sYrz93g3wBFXERLf6b51Mb32mw==
X-Received: by 2002:a05:6e02:1aae:b0:424:7ef5:aeb with SMTP id
 e9e14a558f8ab-4259563befbmr99572855ab.17.1758893128569; 
 Fri, 26 Sep 2025 06:25:28 -0700 (PDT)
Received: from orangepi5-plus ([144.24.43.60])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-425bcb5f6e9sm21946655ab.19.2025.09.26.06.25.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 06:25:28 -0700 (PDT)
Date: Fri, 26 Sep 2025 21:25:16 +0800
From: Furong Xu <0x1207@gmail.com>
To: Rohan G Thomas <rohan.g.thomas@altera.com>
Message-ID: <20250926212516.68d35461@orangepi5-plus>
In-Reply-To: <20250925-hlbs_2-v3-1-3b39472776c2@altera.com>
References: <20250925-hlbs_2-v3-0-3b39472776c2@altera.com>
 <20250925-hlbs_2-v3-1-3b39472776c2@altera.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/2] net: stmmac: est: Drop
 frames causing HLBS error
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

On Thu, 25 Sep 2025 22:06:13 +0800
Rohan G Thomas <rohan.g.thomas@altera.com> wrote:

> From: Rohan G Thomas <rohan.g.thomas@altera.com>
> 
> Drop those frames causing Head-of-Line Blocking due to Scheduling
> (HLBS) error to avoid HLBS interrupt flooding and netdev watchdog
> timeouts due to blocked packets. Tx queues can be configured to drop
> those blocked packets by setting Drop Frames causing Scheduling Error
> (DFBS) bit of EST_CONTROL register.
> 
> Also, add per queue HLBS drop count.
> 
> Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
> Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>

Reviewed-by: Furong Xu <0x1207@gmail.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

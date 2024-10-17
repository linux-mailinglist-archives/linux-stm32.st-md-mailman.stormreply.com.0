Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D999A2159
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Oct 2024 13:43:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C27F8C78032;
	Thu, 17 Oct 2024 11:43:16 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D46D3C5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 11:43:09 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-20caea61132so7029085ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 04:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729165388; x=1729770188;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=puN6p+bMjYJtsrg56y32J8yDB4IjMscvJ6LWf1rgN+k=;
 b=G0RNndbNjsZ1vNpAaaLT8w6bVlBC/CiPD7g+G/FjnKY+eArlsCVqxxFwRHyL4kBV0X
 Qk43gfKrknccrh7h/RHOlLPAWCN7KhW5Yc3mFcvDwF47KTI09PAc7WanY9pvWCz+zVoq
 +W/kxt/Hx/awyxGeJuQt2lwNdSyofdTEpK72El9Yn3WzFMIXYgfQ3gx2P4JqIxwbogTD
 kJguVGVwrlwhmNRiXS4uUuwAfDPH3uoSizivzQCMwaAdL/Fy68vAG2IFNJ2c3rG5nIKb
 wu+OA+86Z2p8k6O2xfqmJIVXQaltOqYZpPa/Q0Tnuxn4od8qh9ZV+Zeh1eMA18A66xH0
 aWxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729165388; x=1729770188;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=puN6p+bMjYJtsrg56y32J8yDB4IjMscvJ6LWf1rgN+k=;
 b=VKUWhsfqNTFXe6NOMEtJcyRUEVoLJ1n/VNFnuzW1nd7suHNLxY8B8VV4EdHwa4x/KY
 pSHdin6eypD9bmNRCF0EKpO1UPKQctPtAyZmvQtGfvs3+rHag8ezUMtCs7KEV2pKv7Lf
 8KJsQOEoSOiZgmp6z6NPtPoIfTYHzMc38Wiu02ADRYhy/G7JjHZpyNtnZ8AYMOneeIFL
 +0IlRZxGVqjLgOEnSYPV0PYz2pcvlnW1Cz5fyxiyjq+0A5bCJcUQgimjER3s1AswOr6j
 +JG5XzdZ699VX4EDmVKv6Mc88N/Dchvzid5ChQ0T5DWVbmmAtjn4e8ufYuw9tG69p8ld
 e4Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXklY7D3PbbfTLAmg7NgMeC/hGo99ME6mAk0jTIMh59UKzoH4ZY50Ectw5FbbQURj71zQ5EO16BOuzBzw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx/cxClrPzH1R9Zvz1pfjv/FC6vmgVLj3Hz3mBkl+pGdRqnIYcZ
 HSiFwqbejMwB9dADBWT+bDD/M+QCaKnAVCnurOpn1hxlJ9J9lhGx
X-Google-Smtp-Source: AGHT+IHJunnh0cmVmNuXc+ArxYGx076cO6tNN4BAqDDpgEMgZwnt3Rmb/lhQ7qL4SW+VAkF2w9+WzQ==
X-Received: by 2002:a17:903:22d1:b0:20c:a498:1e4d with SMTP id
 d9443c01a7336-20cbb2afd17mr267223905ad.60.1729165388225; 
 Thu, 17 Oct 2024 04:43:08 -0700 (PDT)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20d1804b2d9sm42705255ad.184.2024.10.17.04.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 04:43:07 -0700 (PDT)
Date: Thu, 17 Oct 2024 19:42:58 +0800
From: Furong Xu <0x1207@gmail.com>
To: Suraj Jaiswal <quic_jsuraj@quicinc.com>
Message-ID: <20241017194258.000044b3@gmail.com>
In-Reply-To: <20241015121009.3903121-1-quic_jsuraj@quicinc.com>
References: <20241015121009.3903121-1-quic_jsuraj@quicinc.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, kernel@quicinc.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Prasad Sodagudi <psodagud@quicinc.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH v3] net: stmmac: allocate separate page
	for buffer
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

Hi Suraj,

Thanks for this fix.

I tested your patch on XGMAC 3.20a, all goes well, except a performance
drop of ~10%
Like Jakub Kicinski said in V2, this involves more dma_map() and does add
overhead :-/

I might have a better fix for this, I will send to review and CC it to you.

Thanks.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

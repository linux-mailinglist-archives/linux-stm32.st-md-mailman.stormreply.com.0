Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5697A3F03
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Sep 2023 02:35:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B631FC6B477;
	Mon, 18 Sep 2023 00:35:30 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A614C6B461
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Sep 2023 00:35:29 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2bff776fe0bso18514831fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Sep 2023 17:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694997329; x=1695602129;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GO29z9RignFFHbu12u74l94xcqtaPR4h8snHrNTAFJk=;
 b=ZenQBGIPzMTx0rPVdSO8NY3q3ZmYykUHCjBjxtJTHD8VggbNBqEgnnHsprsDBDGAuk
 Q13pZADiaZWqh/9SS8FsOqg9TgQZI9dCf6+uv+QAszPD6IYF+Gfx0sTyTy9rqGrq3vMp
 Ij++KQHnLaeL878pptCrVya2S76Qq5oObpdYIyDQ+EAFPKPpsO0Qr/7C/dJwd5Hj7vE+
 icnGvfL25VSpEMpuTQ6aNYecM+ssLtS0KArsnPR1q4ga2m9MO5osRpZWynS90QPZalkm
 /LwaHKUHHBAgalGkHoMOwTl6vS6HQvYZM/ni2wEpqtB+xLw+8mYfWPmVYbY87kd2OjUX
 X/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694997329; x=1695602129;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GO29z9RignFFHbu12u74l94xcqtaPR4h8snHrNTAFJk=;
 b=WqURjaAb7N0yZkEK7iduKW3m6mqHs3enZ5cZAkcBrmcA2VKMuH8+hLhoYJOU4KSXOs
 3aCG+1Dix9jRJcSq5sf++H6sDLqTN4CT/UKNC/vxRA7ksofXXydDysxgpbiKMy5JjC5f
 ddpe4t2f13mXjSTxCjlgxA4QrZ1MlJ/3bMZK8pMxIFYebpl97Kv+koF9DSyXr3aolZGS
 PU0m2Y1G0PO1ps36xB4kzCPl3zv6HzRAnIHi9c1LsRWaStT9w8YGRG+kUqdidfGXtMge
 nhRDYbb0n2g43CrFeiYOAST5v69qS+R3IXYsugBDSlEO/f+EoYEQLXo8N0lV5K8WkXr0
 cyZA==
X-Gm-Message-State: AOJu0YxyntkKeDEZ1DC7rezr75QS9RUUVD+yA2nKAaeaAubb8+qVkmfW
 93Kjpfl4/Ap8WKIsyXDiV1o=
X-Google-Smtp-Source: AGHT+IHkmIWAA/lVu0Etf2C/gw42g2+fX5kkwfLGMnZ4J9YEoGLPFjeL6R3F/+OLnmA4s3CwzJ7xeA==
X-Received: by 2002:a05:651c:2115:b0:2bf:df8c:4e56 with SMTP id
 a21-20020a05651c211500b002bfdf8c4e56mr7212908ljq.39.1694997328320; 
 Sun, 17 Sep 2023 17:35:28 -0700 (PDT)
Received: from mobilestation ([95.79.219.206])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a05651c154e00b002bff5d46b4csm844737ljp.16.2023.09.17.17.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Sep 2023 17:35:27 -0700 (PDT)
Date: Mon, 18 Sep 2023 03:35:25 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Rohan G Thomas <rohan.g.thomas@intel.com>
Message-ID: <vvgo2wqc66neeapl64g7io7abjfainjgaqb4v3rvxn7bomkwbt@jdlbs6uzfgvh>
References: <20230916063312.7011-1-rohan.g.thomas@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230916063312.7011-1-rohan.g.thomas@intel.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 netdev@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v7 0/2] net: stmmac: Tx coe sw
	fallback
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

On Sat, Sep 16, 2023 at 02:33:10PM +0800, Rohan G Thomas wrote:
> Hi,
> DW xGMAC IP can be synthesized such that it can support tx checksum
> offloading only for a few initial tx queues. Also as Serge pointed
> out, for the DW QoS IP, tx coe can be individually configured for
> each tx queue. This patchset adds support for tx coe sw fallback for
> those queues that don't support tx coe. Also, add binding for
> snps,coe-unsupported property.

The series looks good to me. Thanks!
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> 
> changelog v7:
> * Updated commit message.
> * Add blank lines around newly added dt binding.
> 
> changelog v6:
> * Reworked patchset to cover DW QoS Ethernet IP also.
> 
> changelog v5:
> * As rightly suggested by Serge, reworked redundant code.
> 
> changelog v4: 
> * Replaced tx_q_coe_lmt with bit flag.
> 
> changelog v3: 
> * Resend with complete email list.
> 
> changelog v2: 
> * Reformed binding description.
> * Minor grammatical corrections in comments and commit messages.
> 
> Rohan G Thomas (2):
>   dt-bindings: net: snps,dwmac: Tx coe unsupported
>   net: stmmac: Tx coe sw fallback
> 
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml |  5 +++++
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c     | 10 ++++++++++
>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c |  3 +++
>  include/linux/stmmac.h                                |  1 +
>  4 files changed, 19 insertions(+)
> 
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 443E3869E83
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Feb 2024 19:02:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB904C6C841;
	Tue, 27 Feb 2024 18:02:21 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 964F6C64102
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Feb 2024 18:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709056939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RxNc/aFVnNDKr6nzABJwfQofcGO3o2pWudIkQ0RdBpM=;
 b=GrcVW6lT6EoBQpGcVYHGxnV2Crd8R3xKEHIbV1tbgTqriddKS7B2afsrksopFP2HwqWHob
 HUIxW/ubgbJR3Mvy2URhvKNV8a2r5+kt/uQuQy369lgjFNWvDQA7GU8JmYF5YdmclJH2RW
 rjr+b3KHQ3bDBu+pkWuMTjD4KpwQ6VI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-WeqRct-uNDah1xuyO4WlBg-1; Tue, 27 Feb 2024 13:02:18 -0500
X-MC-Unique: WeqRct-uNDah1xuyO4WlBg-1
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-42ea7bcb203so2552171cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Feb 2024 10:02:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709056937; x=1709661737;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RxNc/aFVnNDKr6nzABJwfQofcGO3o2pWudIkQ0RdBpM=;
 b=bmH5eVsWPYH2LmNyQOESFZ1LeywiJoAE04ohW31nSWMNZSibgZFhF5iDyMu1J827w3
 vD+/Lhot0Uz4DFcY/HKEIcvDJD0CbTAuQSWZWwekudXsYJaBCIwyJhgsTL4C1fLVuK08
 akzpLRvVAcEsAkj2w/oRMrDUmveEHf0V73sMKDVcBX3i6m9Eb0JjS/WhSro5rbTBYwfW
 uU/v6D6JDyg5LAAwnNKoH+PVzrq/oco1OB84JRG1c16T7BHZQbBP5zxHrq6P3H6oXGOe
 l2Wl/TW+hSUXEWPXXzLdGdy3Wpgm+AGRV9nObdfXV6p0wBgKBK6fF5Lbb0qwZnSuPTFT
 mQGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIftlQZWCQ31ZBu95TfFe/4OV8soBrRilNouIocAqFMYkFr0Q5dGvR+QR1iKyXG/JjLR+NxLu/pCiko8mBhBpT5/nNQQbfd8n0j3m+aVddIjZ5/nUh3qDo
X-Gm-Message-State: AOJu0YzLMtAErhvUcUEoDiiNqUJ0UY0gGVhP/wdRPzuKp4Xct5ACwsga
 Wc18PT6Mw/7iFA6F4L9wQjVhBdMcB8MVvUkof7N8/lqAnqRK5i6Bhqho3i6RCXCqJsVWcgbGUKE
 fOe8rrPy6Tx7JPAxf9eDZG7cU3Wd9jkz+xj+ulADlfduUaO4D64YjpVnNFrov8HyB18dSnDpmL+
 9yXQ==
X-Received: by 2002:a05:622a:1a97:b0:42e:a717:cbca with SMTP id
 s23-20020a05622a1a9700b0042ea717cbcamr802357qtc.41.1709056936782; 
 Tue, 27 Feb 2024 10:02:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFdFPNupQsoGCNMoyarnVyVV+samDOQcNLB9zEJi7UDBBSyn6KQpoOrEG/VbkkBYeBv36V0Uw==
X-Received: by 2002:a05:622a:1a97:b0:42e:a717:cbca with SMTP id
 s23-20020a05622a1a9700b0042ea717cbcamr802291qtc.41.1709056936129; 
 Tue, 27 Feb 2024 10:02:16 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a05622a1a0c00b0042c7b9abef7sm3766020qtb.96.2024.02.27.10.02.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 10:02:15 -0800 (PST)
Date: Tue, 27 Feb 2024 12:02:13 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Sarosh Hasan <quic_sarohasa@quicinc.com>
Message-ID: <3refwt5x2xplibxkne5sae4ybic7inzmfwna4vkhprpf3nyqom@lwng6mkbe3gc>
References: <20240226094226.14276-1-quic_sarohasa@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <20240226094226.14276-1-quic_sarohasa@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Sneh Shah <quic_snehshah@quicinc.com>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 kernel@quicinc.com, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Prasad Sodagudi <psodagud@quicinc.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v2] net: stmmac:
 dwmac-qcom-ethqos: Update link clock rate only for RGMII
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

On Mon, Feb 26, 2024 at 03:12:26PM +0530, Sarosh Hasan wrote:
> Updating link clock rate for different speeds is only needed when
> using RGMII, as that mode requires changing clock speed when the link
> speed changes. Let's restrict updating the link clock speed in
> ethqos_update_link_clk() to just RGMII. Other modes such as SGMII
> only need to enable the link clock (which is already done in probe).
> 
> Signed-off-by: Sarosh Hasan <quic_sarohasa@quicinc.com>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Tested-by: Andrew Halaney <ahalaney@redhat.com> # sa8775p-ride

> ---
> v2 changelog:
> - Addressed Konrad Dybcio comment on optimizing the patch
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 31631e3f89d0..c182294a6515 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -169,6 +169,9 @@ static void rgmii_dump(void *priv)
>  static void
>  ethqos_update_link_clk(struct qcom_ethqos *ethqos, unsigned int speed)
>  {
> +	if (!phy_interface_mode_is_rgmii(ethqos->phy_mode))
> +		return;
> +
>  	switch (speed) {
>  	case SPEED_1000:
>  		ethqos->link_clk_rate =  RGMII_1000_NOM_CLK_FREQ;
> -- 
> 2.17.1
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

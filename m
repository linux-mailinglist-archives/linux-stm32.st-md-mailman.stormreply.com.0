Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIeZNPIki2mTQQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Feb 2026 13:30:42 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 651C111AD67
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Feb 2026 13:30:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0852BC87EBF;
	Tue, 10 Feb 2026 12:30:42 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ACD8BC1A97F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Feb 2026 12:30:40 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61A7G2Nk1419398
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 10 Feb 2026 12:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=tf5C3tVCVlr5koPgdEsckZhU
 RpQdzZSNvhMopb8sZWU=; b=bo26i/vBsPD6UlbD6WjFK/gHHl7FqpuuDkulWzeH
 2uXDYjbmK7R7LuAwv1VWnq7aMYdhWonMwYtnAwSebVkn4duLhWn4crYVYf5HRQzi
 f12s3mTqX3JHcfNa+nufwBIPBDD8Km3oaWdiL4NU3iH5qpW54ZzskaQgW1I06d7d
 KWgdAOjgSo7QzU8Ng54GBQ6Zi4QjTcTNtxTK7RQl1XpSdxRN8+rKRt5Op+sHLfdb
 85O9bTGYen90WS5B8esbouRxUH5CK0FYUQFI4MIJmx8/lYHOBhk6dzPJgFeqNF6C
 WQCqKWJhjQNVHARwuYbWSTkJo+uTixNlUhg3EsuiyLOBdQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7rpvtdeu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Feb 2026 12:30:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2aad5fc5b2fso9501655ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Feb 2026 04:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1770726638; x=1771331438;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tf5C3tVCVlr5koPgdEsckZhURpQdzZSNvhMopb8sZWU=;
 b=X3dtxREoOS2KtaC13b7iWcn/Cnw56eQSxafY3VdqFjK6DzpNU3OL1sPRPUd3E+7RKb
 1teH/pp7sh+lhecUMD9RPaYeCEvG4hF2l7ksuj35Z9sioIE93w+HjCHLBJUvkO8YE1P5
 KrNUx/TpqLtqoL5FKl7Ffchyi6VR6IpvHGQZ0CtwPXpY8ewa9CQWhvHO9L4k6thF/urY
 k3iahcoiOqaIFDzanH38ivemDuXt2n2TkNvCz2+2Lg3uisRgEBkNW3f+evWd8lC8sNIb
 DK6C5r/Ptu6Hh3o0DYwA6v+Ix1/dB8RDFspHMHa7nlJAzgTCxm7pkt04r5n6JJf8I7X2
 Plfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770726638; x=1771331438;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tf5C3tVCVlr5koPgdEsckZhURpQdzZSNvhMopb8sZWU=;
 b=Xilp3PJLWYrO/JhwxPKGVoSpxZoB9mRHd1bmCeznf3mIilbIniPBklOXMa4rNXLImg
 eD+o4QvR26Rmc9C8PlktlOW5DZrOWc6L9aDkgZpTi+o1RcuYTXZ9DY7hHG91P9SGsLGq
 rIRBpzTx7n+zh2yq0Pp9S0kRaP70spIMYxc7055l/2KVuVt+u5mEzUhFZ2/YK1TEsSJR
 T+kopRrcHVQolFEAJYv6r+ILFblxiWtVrVYbOsGB3Xb7GchESwtPnraVe8u9Cnmli98i
 24EqACEa7TTiU2YJhVYU5nNiy0UvX3dhKuQ0T91Ezr7F6ccIVYEbS98jui1bRYCbGMwn
 O4DQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhn6MJ96rvHNxyoFkvPNp06h7TcSge7yG3zXi1jbC5b8U+sz6Wzhn9CFTmPUZP7Lfg0pZmPSQqUMqCTw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwO9HggKyJLTEH5n1us6/2i4wibQ/S/CELFK47IDqLWqPaKi3/1
 yopFcfDgc8ytjiWjOnsvTZZtvLVQGiOHTFe+xhbEVj/HgblsxystiSqMJLZWStiU5dahEBYh++e
 8eA2fNo4nlj4GeizAp22MbCLD0I8OnKs2N+qR3AhdtDu0fscPMUkHFwCCeUgLF55NVXp5OgIrMe
 sVTLWMRcg=
X-Gm-Gg: AZuq6aLLSATD9zhTavz95Bhddzg0wba6H1LvHmYDnRTaWq2ZEogmwa1AUnfk9DtSIkI
 /1HDC6HwOpMW6KXsHN72UlXAr8iPcZW/lV6bEoeq2iaw4oH+V/p0KbQslP2LxdcX6/rgZBA2VEq
 yDRwbjx43f36xvocfXDpJ7zp8HimIALmaKoM+9KYI40dxdHwHCi3CUYcJch8gV8WGvYGyfWXJie
 /+omulfzDAhKmJP3pGGF/hCl41KQfnNcndVp1Al3tolukdArhyBaAO5xuMVtcQNRhnHYy3atsfY
 ysWdgSXxAaMqAEO1UA1dO94kdWRQREdurEH/muMuCdk+7aIJ6FSNixnwOYLQvQRhlqHweDarS76
 0jVi6JXoANM6e1naApw403yE4Sb1lrP63ZcI=
X-Received: by 2002:a17:902:c952:b0:2aa:d333:ce84 with SMTP id
 d9443c01a7336-2aad333d30dmr80243115ad.11.1770726638008; 
 Tue, 10 Feb 2026 04:30:38 -0800 (PST)
X-Received: by 2002:a17:902:c952:b0:2aa:d333:ce84 with SMTP id
 d9443c01a7336-2aad333d30dmr80242795ad.11.1770726637482; 
 Tue, 10 Feb 2026 04:30:37 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a951c9189bsm147523205ad.36.2026.02.10.04.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 04:30:36 -0800 (PST)
Date: Tue, 10 Feb 2026 18:00:30 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <aYsk5mFH2YlAO1zd@oss.qualcomm.com>
References: <E1voPUH-000000083ji-25FH@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1voPUH-000000083ji-25FH@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDEwNCBTYWx0ZWRfXyJ33dPPpXrgq
 ZoERxGSViWANWzkCbFT9ci1vRK7q94BU7DrX0JHQ3CLPBpTpyk8SX3BFWv2uL9fC7ovgU16V1vD
 3UBzPcWIvMKz9nUnG7l/1xT3iAUWMuynnUfsGCPdS6VMeL1mZzT85Jxwi55jDK+Sp04yAzr9dR5
 S+u7Jkma8d8OTiltMrwo7OruzcE60UwgKhSfiJc9Ob3beBTGDoQTBVPODKdSLbxydGQMA5SgZDh
 4O6XJsIPVA/j8QR/9dP/YFu1wvGnUNumYj5IkH3AGZtgrwABeJpNaiuhkT7QgnoeteMd+8MqeHD
 Jk8VnenfZdeKw/wn9KNwKV1x2ft7nH0+GH0fR/SiBKPRTaAi9DnHrgWx6iIMdzDb2pXEtb7+4p9
 p0iWOQgYbB5ZFAYdiuWyXZG5H5j+EJDiDsywx/MKtu+WLr2j2x5U5UWUsjpZZ6gVyfmB/jfsqng
 t5Xj697wr4oPPApveDQ==
X-Authority-Analysis: v=2.4 cv=KKZXzVFo c=1 sm=1 tr=0 ts=698b24ef cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=C4_wdI1o37mb7NTJsvEA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-ORIG-GUID: ZAmEG1czizl76KGrTRps2jAYzXCNxUyt
X-Proofpoint-GUID: ZAmEG1czizl76KGrTRps2jAYzXCNxUyt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100104
Cc: Andrew Lunn <andrew@lunn.ch>, Sneh Shah <quic_snehshah@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Vinod Koul <vkoul@kernel.org>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: qcom-ethqos: fix
 qcom_ethqos_serdes_powerup()
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:rmk+kernel@armlinux.org.uk,m:andrew@lunn.ch,m:quic_snehshah@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:vkoul@kernel.org,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,qualcomm.com:email,armlinux.org.uk:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 651C111AD67
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 05:19:21PM +0000, Russell King (Oracle) wrote:
> Add cleanup for failure paths in qcom_ethqos_serdes_powerup(). This
> was missing calling phy_exit() and phy_power_off() at appropriate
> failure points.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c  | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 869f924f3cde..af8204c0e188 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -659,10 +659,18 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
>  		return ret;
>  
>  	ret = phy_power_on(ethqos->serdes_phy);
> -	if (ret)
> +	if (ret) {
> +		phy_exit(ethqos->serdes_phy);
>  		return ret;
> +	}
>  
> -	return phy_set_speed(ethqos->serdes_phy, ethqos->serdes_speed);
> +	ret = phy_set_speed(ethqos->serdes_phy, ethqos->serdes_speed);
> +	if (ret) {
> +		phy_power_off(ethqos->serdes_phy);
> +		phy_exit(ethqos->serdes_phy);
> +	}
> +
> +	return ret;
>  }
>  
>  static void qcom_ethqos_serdes_powerdown(struct net_device *ndev, void *priv)
> -- 
> 2.47.3
> 

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2B0869F4C
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Feb 2024 19:46:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0A59C6C841;
	Tue, 27 Feb 2024 18:46:01 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1126C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Feb 2024 18:45:59 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41RExOxW022713; Tue, 27 Feb 2024 18:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=ij4CQGNgDIwyFGI+QSDhuNH/glFVWYAyh+qT7nJHK4g=; b=bO
 GEpQ2jLpmbsjN+Gg6JqEhFhz5N5l2O69ti2P2UlCplO8nFAgZnunEp7azIPfh844
 pfHqFEvV2AZPs2cmw9cQqFDxhW9PRDZJjhucNW72+Cekk0qBALdFcgIz7SxD5sF4
 pmaixUqaT+45ACmLVgpc1qX/GURA7hDrBMrgdOUqUmMMcoG0j0Q40vw2rUDdBb5J
 inZqFQWsDMqPS6zP++e4FWk861YX1HJpkczsU3Za2T282JT47tD9bGM/eGrXKG7A
 mbO9aqfzKMfXh5H58/oWMF9EK1fiEPvNDWuoxji2F9U2rHYRKMZ03wV+CA1stlZ5
 /kE8fzkx32NsrEcFBYYg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3whd7b1b3u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Feb 2024 18:45:46 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com
 [10.52.223.231])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41RIjk95027971
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Feb 2024 18:45:46 GMT
Received: from [10.46.19.239] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 27 Feb
 2024 10:45:42 -0800
Message-ID: <17c06c23-49b3-4db9-a021-82904eae6a7d@quicinc.com>
Date: Tue, 27 Feb 2024 10:45:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Sarosh Hasan <quic_sarohasa@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 Prasad Sodagudi <psodagud@quicinc.com>,
 Andrew Halaney <ahalaney@redhat.com>, Rob Herring <robh@kernel.org>
References: <20240226094226.14276-1-quic_sarohasa@quicinc.com>
From: "Abhishek Chauhan (ABC)" <quic_abchauha@quicinc.com>
In-Reply-To: <20240226094226.14276-1-quic_sarohasa@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: kWK47h9DpFMyS7UTOUICurYLrPe2mflX
X-Proofpoint-ORIG-GUID: kWK47h9DpFMyS7UTOUICurYLrPe2mflX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-27_05,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 mlxscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2402270145
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Sneh Shah <quic_snehshah@quicinc.com>, kernel@quicinc.com
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



On 2/26/2024 1:42 AM, Sarosh Hasan wrote:
> Updating link clock rate for different speeds is only needed when
> using RGMII, as that mode requires changing clock speed when the link
> speed changes. Let's restrict updating the link clock speed in
> ethqos_update_link_clk() to just RGMII. Other modes such as SGMII
> only need to enable the link clock (which is already done in probe).
> 
> Signed-off-by: Sarosh Hasan <quic_sarohasa@quicinc.com>
Reviewed-by: Abhishek Chauhan <quic_abchauha@quicinc.com>

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
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
